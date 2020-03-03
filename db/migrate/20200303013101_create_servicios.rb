class CreateServicios < ActiveRecord::Migration[6.0]
  def change
    create_table :servicios do |t|
      t.string :name
      t.json :hours

      t.timestamps
    end
  end
end
