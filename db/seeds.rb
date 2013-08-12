#   10.times do 
#   @deck = Deck.create(name:Faker::Company.bs)
#   10.times do
#     @deck.cards << Card.create(question:Faker::Lorem.sentence, answer:'correct')
#   end
# end

module AddDeck
  
  def self.add_csv(name, csv_path, answer_first = false)
    file = File.open(csv_path)
    deck = Deck.new(name: name)
    while(line = file.gets)
      stuff = line.split(",")
      if answer_first
        deck.cards.new(question: stuff[1], answer: stuff[2])
      else
        deck.cards.new(question: stuff[0], answer: stuff[1])
      end
    end
    deck.save
  end
end

AddDeck.add_csv("Addition","./db/math.csv")
AddDeck.add_csv("Genetic", "./db/genetics.csv", true)
AddDeck.add_csv("Middle Ages","./db/middle_ages.csv", true)
