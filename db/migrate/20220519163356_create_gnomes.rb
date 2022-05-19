class CreateGnomes < ActiveRecord::Migration[7.0]
  def change
    create_table :gnomes do |t|
      t.integer :route_id
      t.string :gnome_name
      t.string :g_description
      t.float :location_x
      t.float :location_y

      t.timestamps
    end
  end
end
