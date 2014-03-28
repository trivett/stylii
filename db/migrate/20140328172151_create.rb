class Create < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :client_id
      t.integer :stylist_id
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
