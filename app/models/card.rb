class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck

  validates_presence_of :question, :answer
end
