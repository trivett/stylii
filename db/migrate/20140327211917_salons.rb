class Salons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :name
      t.string :address
      t.string :photo_url
      t.string :phone_number
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :yelp_rating_image_url
      t.float :yelp_rating
    end
  end
end
