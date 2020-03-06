class CreateTurnos < ActiveRecord::Migration[6.0]
  def change
    create_table :turnos do |t|
      t.integer :servicio_id
      t.integer :usuario_id
      t.integer :semana
      t.string :dia
      t.integer :inicio
      t.integer :fin

      t.timestamps
    end
  end
end
