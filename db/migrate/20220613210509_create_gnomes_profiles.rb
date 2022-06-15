class CreateGnomesProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :gnomes_profiles do |t|
      t.integer :profile_id
      t.integer :gnome_id

      t.timestamps
    end

    add_index :gnomes_profiles, [:profile_id, :post_id], unique: true
  end
end
