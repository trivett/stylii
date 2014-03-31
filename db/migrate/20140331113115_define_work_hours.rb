class DefineWorkHours < ActiveRecord::Migration
  def change
    add_column :stylists, :starts_work_at, :time
    add_column :stylists, :ends_work_at, :time
    add_column :stylists, :day_off, :string
  end
end
