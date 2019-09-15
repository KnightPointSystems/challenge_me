class AddTimeZoneToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :time_zone, :string, null: true, limit: 35, after: :email
  end
end