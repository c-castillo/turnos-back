class Turno < ApplicationRecord
  belongs_to :servicio
  validates :servicio_id, presence: true
  validates :semana, presence: true
  validates :dia, presence: true
  validates :inicio, presence: true
  validates :fin, presence: true
end
