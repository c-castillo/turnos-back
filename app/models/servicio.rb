# frozen_string_literal: true

# Maneja los distintos servicios soportados por la plataforma
class Servicio < ApplicationRecord
  has_many :turnos
  has_many :usuarios
  validates :nombre, presence: true
  validates :nombre, uniqueness: true
  validates :horarios, presence: true

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
            turnos.new(semana: semana, dia: dia, inicio: turno[0], fin: turno[1], usuario_id: asignado_id)
            puts "ASIGNADO inicio: #{turno[0]} fin: #{turno[1]} usuario_id: #{asignado_id} dia: #{dia} semana: #{semana}"
          end
        else
          turnos_by_day(e.keys.first).each do |turno|
            puts "SIN ASIGNAR inicio: #{turno[0]} fin: #{turno[1]} dia: #{dia} semana: #{semana}"
            turnos.new(semana: semana, dia: dia, inicio: turno[0], fin: turno[1])
          end
        end
      end
      save!
    end
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
