class ChangeDatatypeAlltimeOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :alltime, :string
  end
end