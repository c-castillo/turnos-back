# frozen_string_literal: true

# Usuarios asociados a un servicio
class Usuario < ApplicationRecord
  belongs_to :servicio
  validates :servicio_id, presence: true
  validates :nombre, presence: true
end
