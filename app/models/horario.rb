# frozen_string_literal: true

# Horarios asociados a un servicio
class Horario < ApplicationRecord
  belongs_to :servicio
  validates :servicio_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
