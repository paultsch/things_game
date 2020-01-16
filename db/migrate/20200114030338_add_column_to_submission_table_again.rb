class AddColumnToSubmissionTableAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column :submissions, :code, :string
    add_column :submissions, :code_id, :integer, references: :code
    add_foreign_key :submissions, :codes, column: :code_id, primary_key: :id
  end
end
