class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.boolean :is_user
      t.boolean :is_admin
      t.string :role_name

      t.timestamps
    end
  end
end
