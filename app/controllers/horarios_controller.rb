# frozen_string_literal: true

class HorariosController < ApplicationController
  def show
    @horario = Horario.find(params[:id])
    json_response(@horario, :ok)
  end

  def create
    @horario = Horario.create(horarios_params)
    json_response(@horario, :created)
  end

  private

  def horarios_params
    params.permit(:servicio_id, :start_time, :end_time)
  end
end
