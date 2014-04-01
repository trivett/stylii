class AddDigestToStylists < ActiveRecord::Migration
  def change
    add_column :stylists, :password_digest, :string
  end
end
