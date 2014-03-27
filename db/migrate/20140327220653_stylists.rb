class Stylists < ActiveRecord::Migration
  def change
    create_table :stylists do |t|
      t.integer :salon_id
      t.string :name
      t.date :birthdate
      t.integer :male_price
      t.integer :female_price
      t.string  :specialty
      t.string  :photo_url
    end
  end
end
