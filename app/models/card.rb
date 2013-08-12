class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck

  validates_presence_of :question, :answer

  def get_answer
    ["#{answer.strip}, muthafucka",
     "Fuckin' #{answer.strip}",
     "It's #{answer.strip}, you idiot."].sample
  end
end
