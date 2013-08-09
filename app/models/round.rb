class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  validates_presence_of :user_id, :deck_id

  def get_card_after(card)
    card_index = self.deck.cards.find_index(card)
    self.deck.cards[card_index + 1]
  end

  def calculate_score
    self.score = self.guesses.where(correctness: true).count / self.guesses.all.count
  end
end
