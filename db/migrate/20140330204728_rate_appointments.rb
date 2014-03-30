class RateAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :stylii_rating, :integer
  end
end
