class AddStylistRating < ActiveRecord::Migration
  def change
    add_column :stylists, :rating_average, :integer
  end
end
