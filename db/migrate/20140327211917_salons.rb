class Salons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :name
      t.string :address
      t.string :photo_url
      t.string :phone_number
    end
  end
end
