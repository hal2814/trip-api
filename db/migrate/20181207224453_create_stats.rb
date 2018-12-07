class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.string :max_speed
      t.string :distance
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
