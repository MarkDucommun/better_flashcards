class AddScoresToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :score, :integer, default: 100
  end
end
