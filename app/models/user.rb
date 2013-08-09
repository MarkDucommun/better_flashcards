class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :cards, through: :guesses
  has_many :decks, through: :rounds

  eval(UserHelper.add_methods_to_model)
end
