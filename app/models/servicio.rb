# frozen_string_literal: true
require 'date'

# Maneja los distintos servicios soportados por la plataforma
class Servicio < ApplicationRecord
  has_many :turnos
  has_many :usuarios
  validates :nombre, presence: true
  validates :nombre, uniqueness: true
  validates :horarios, presence: true

  DIAS = %w{Lunes Martes Miercoles Jueves Viernes Sabado Domingo}

  def asignar(semana)
    if turnos.where(semana: semana).empty?
      disp = disponibilidad_usuarios
      sort_horarios.map do |e|
        asignado_id = disp.max_by { |_k, v| v }.first
        dia = e.keys.first
        horas_turno = e.values.first

        if disp[asignado_id] >= horas_turno
          disp[asignado_id] -= horas_turno
          turnos_by_day(dia).each do |turno|
            turnos.new(semana: semana, dia: DIAS.index(dia)+1, dia_completo: week_dates(semana, dia), inicio: turno[0], fin: turno[1], usuario_id: asignado_id)
            puts "ASIGNADO inicio: #{turno[0]} fin: #{turno[1]} usuario_id: #{asignado_id} dia: #{week_dates(semana, dia)} semana: #{semana}"
          end
        else
          turnos_by_day(dia).each do |turno|
            asignado_id = disp.max_by { |_k, v| v }.first
            if disp[asignado_id].positive?
              turnos.new(semana: semana, dia: DIAS.index(dia)+1, dia_completo: week_dates(semana, dia), inicio: turno[0], fin: turno[1], usuario_id: asignado_id)
              puts "ASIGNADO inicio: #{turno[0]} fin: #{turno[1]} usuario_id: #{asignado_id} dia: #{week_dates(semana, dia)} semana: #{semana}"
              disp[asignado_id] -= 1
            else
              puts "SIN ASIGNAR inicio: #{turno[0]} fin: #{turno[1]} dia_completo: #{week_dates(semana, dia)} semana: #{semana}"
              turnos.new(semana: semana, dia: DIAS.index(dia)+1, dia_completo: week_dates(semana, dia), inicio: turno[0], fin: turno[1])
            end
          end
        end
      end
      save!
    end
  end


  def week_dates( week_num, dia )
    year = Time.now.year
    week_day = Date.commercial( year, week_num, DIAS.index(dia)+1)
    return dia + week_day.strftime( " %d de %b" )
  end

  def disponibilidad_usuarios
    disponibilidad = usuarios.map do |u|
      disponibilidad = {}
      disponibilidad[u.id] = u.disponibilidad.to_i
      disponibilidad
    end
    disponibilidad.inject(:merge)
  end

  def sort_horarios
    horarios = self.horarios.map do |h|
      sorted = {}
      sorted[h['day']] = h['turnos']['end'].to_i - h['turnos']['start'].to_i
      sorted
    end
    horarios.sort_by { |_k, v| v }.reverse
  end

  def turnos_by_day(day)
    start_and_end = horarios.select { |t| t['day'] == day }[0]['turnos']
    (start_and_end['start'].to_i..start_and_end['end'].to_i - 1).map { |h| [h, h + 1] }
  end
end
