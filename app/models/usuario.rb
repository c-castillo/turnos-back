# frozen_string_literal: true

# Usuarios asociados a un servicio
class Usuario < ApplicationRecord
  belongs_to :servicio
  validates :servicio_id, presence: true
  validates :name, presence: true
end
