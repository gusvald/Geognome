class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :profile_id
      t.integer :gnome_id

      t.timestamps
    end
  end
end
