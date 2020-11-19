class AddCoordinatesToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :latitude, :float
    add_column :boats, :longitude, :float
  end
end
