class CreateColumnsInUsersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :admin, :boolean
    add_column :users, :player, :boolean
    add_column :users, :game_code, :string
    add_column :users, :score, :integer
  end
end
