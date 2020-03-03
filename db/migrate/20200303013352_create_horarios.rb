# frozen_string_literal: true

class CreateHorarios < ActiveRecord::Migration[6.0]
  def change
    create_table :horarios do |t|
      t.integer :servicio_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
