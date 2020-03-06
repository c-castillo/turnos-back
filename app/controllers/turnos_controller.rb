# frozen_string_literal: true

class TurnosController < ApplicationController
  def index
    @turnos =
    if (params[:servicio_id] && params[:semana])
      Turno.where(servicio_id: params[:servicio_id], semana: params[:semana]).order(:dia)
    else
      []
    end
    json_response(@turnos, :ok)
  end

  def show
    @turno = Turno.find(params[:id])
    json_response(@turno, :ok)
  end

  def create
    @turno = Turno.create(turnos_params)
    json_response(@turno, :created)
  end

  private

  def turnos_params
    params.permit(:servicio_id, :semana, :dia, :inicio, :fin)
  end
end
