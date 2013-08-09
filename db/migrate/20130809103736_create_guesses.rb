class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :response, null: false
      t.boolean :correctness
      t.belongs_to :card, index: true
      t.belongs_to :round, index: true
      t.timestamps
    end
  end
end
