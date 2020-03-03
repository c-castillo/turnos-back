# frozen_string_literal: true

class UsuariosController < ApplicationController
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
    params.permit(:name, :servicio_id)
  end
end
