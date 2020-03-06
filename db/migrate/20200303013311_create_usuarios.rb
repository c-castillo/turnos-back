class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.integer :servicio_id
      t.string :nombre
      t.integer :disponibilidad
      t.string :color

      t.timestamps
    end
  end
end
