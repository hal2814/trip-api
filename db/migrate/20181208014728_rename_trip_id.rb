class RenameTripId < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :trip_id, :trip_id_number
  end
end
