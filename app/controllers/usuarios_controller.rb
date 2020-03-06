# frozen_string_literal: true

class UsuariosController < ApplicationController

  def index
    @usuarios = params[:servicio_id] ?
    Usuario.where(servicio_id: params[:servicio_id]) :
    Usuario.all
    json_response(@usuarios, :ok)
  end

  def show
    @usuario = Usuario.find(params[:id])
    json_response(@usuario, :ok)
  end

  def create
    @usuario = Usuario.create(usuarios_params)
    json_response(@usuario, :created)
  end

  private

  def usuarios_params
    params.permit(:nombre, :servicio_id, :disponibilidad, :color)
  end
end
