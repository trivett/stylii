class AddEmailToStylist < ActiveRecord::Migration
  def change
    add_column :stylists, :email, :string
  end
end
