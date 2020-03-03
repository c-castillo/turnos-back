class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.integer :servicio_id
      t.string :name

      t.timestamps
    end
  end
end
