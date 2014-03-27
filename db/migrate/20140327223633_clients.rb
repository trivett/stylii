class Clients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :photo_url
      t.text :notes
      t.date :birthdate
      t.string :gender
      t.string :phone_number
      t.string :email
      t.string :password_digest
    end
  end
end
