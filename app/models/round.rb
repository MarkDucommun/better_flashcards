class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  validates_presence_of :user_id, :deck_id

  def next_card_after(card)
    card_index = self.deck.cards.find_index(card)
    self.deck.cards[card_index + 1]
  end

  def calculate_score
    puts right_guesses = self.guesses.where(correctness: true).count
    puts total_guesses = self.guesses.count
    self.score = ((right_guesses.to_f / total_guesses) * 100).to_i
    self.save 
  end

  def wrong_guesses
    self.guesses.where(correctness: nil)
  end
end
