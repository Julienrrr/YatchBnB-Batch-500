class AddColumnsToBoat < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :rating, :float
    add_column :boats, :heliport, :boolean
    add_column :boats, :pool, :boolean
    add_column :boats, :spa, :boolean
    add_column :boats, :staff, :boolean
  end
end
