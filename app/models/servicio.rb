# frozen_string_literal: true

# Maneja los distintos servicios soportados por la plataforma
class Servicio < ApplicationRecord
  has_many :horarios
  has_many :usuarios
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :hours, presence: true
end
