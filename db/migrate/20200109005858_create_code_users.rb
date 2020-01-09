class CreateCodeUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :code_users do |t|
      t.references :code, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :score
      t.integer :order
      t.timestamps
    end
  end
end
