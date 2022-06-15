class AddLocationToGnomes < ActiveRecord::Migration[7.0]
  def change
    add_column :gnomes, :location, :string
  end
end
