class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :cards, through: :guesses
  has_many :decks, through: :rounds

  eval(UserHelper.add_methods_to_model)

  def get_undone_decks
    (Deck.all - self.decks).slice(0,5)
  end

  def get_top_rounds
    self.rounds.order('score DESC').limit(5)
  end

  def get_recent_rounds
    self.rounds.order('id DESC').limit(5)
  end
end
