class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :route_id
      t.string :title

      t.timestamps
    end
  end
end
