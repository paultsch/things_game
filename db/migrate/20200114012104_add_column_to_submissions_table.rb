class AddColumnToSubmissionsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :submissions, :guesser, :string
    add_column :submissions, :guesser_id, :integer, references: :user
    add_foreign_key :submissions, :users, column: :guesser_id, primary_key: :id
  end
end
