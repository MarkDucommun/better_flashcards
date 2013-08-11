class AddDefaultCorrectness < ActiveRecord::Migration
  def change
    change_column :guesses, :correctness, :boolean, default: false
  end
end
