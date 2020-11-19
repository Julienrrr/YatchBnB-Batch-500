class AddAddressToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :address, :string
  end
end
