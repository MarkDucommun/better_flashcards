  10.times do 
  @deck = Deck.create(name:Faker::Company.bs)
  10.times do
    @deck.cards << Card.create(question:Faker::Lorem.sentence, answer:'correct')
  end
end
