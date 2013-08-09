class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :card
  belongs_to :round

  validates_presence_of :card_id, :round_id

  before_validation :get_correctness

  def get_correctness
    self.correctness = true if self.card.answer.downcase == response.downcase
  end
end
