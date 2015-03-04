class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.datetime :day
      t.integer :hour
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :rooms, :users
  end
end
