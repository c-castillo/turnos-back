class CreateServicios < ActiveRecord::Migration[6.0]
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.json :horarios

      t.timestamps
    end
  end
end
