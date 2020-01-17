class CreateThings < ActiveRecord::Migration[5.1]
  def change
    create_table :things do |t|
      t.text :thing
      t.timestamps
    end
  end
end
