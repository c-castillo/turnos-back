# frozen_string_literal: true

class ServiciosController < ApplicationController
  def index
    @servicios = Servicio.all
    json_response(@servicios, :ok)
  end

  def show
    @servicio = Servicio.find(params[:id])
    json_response(@servicio, :ok)
  end

  def create
    @servicio = Servicio.create(servicios_params)
    json_response(@servicio, :created)
  end

  private

  def servicios_params
    params.permit(:nombre, horarios: %i[day start finish] )
  end
end
