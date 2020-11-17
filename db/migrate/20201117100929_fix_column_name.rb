class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :boats, :model, :boat_model
  end
end
