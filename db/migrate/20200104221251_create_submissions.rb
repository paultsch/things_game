class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.integer :round
      t.text :submission
      t.references :user, foreign_key: true
      t.integer :guesser
      t.boolean :guessed_correctly
      t.timestamps

    end
  end
end
