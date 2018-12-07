class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :id
      t.string :start
      t.string :stop
      t.string :status
      t.string :vehicleId
      t.string :deviceId

      t.timestamps
    end
  end
end
