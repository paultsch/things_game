class AddColumnToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :code, :string
  end
end
