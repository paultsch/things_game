class CreateCreateCodeThings < ActiveRecord::Migration[5.1]
  def change
    create_table :code_things do |t|
      t.references :code, foreign_key: true
      t.references :thing, foreign_key: true
      t.integer :round
      t.timestamps
    end
  end
end
