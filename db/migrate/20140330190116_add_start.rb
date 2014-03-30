class AddStart < ActiveRecord::Migration
  def change
    add_column :appointments, :user_input, :string
  end
end
