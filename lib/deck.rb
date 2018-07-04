require './lib/card'
require './lib/guess'

class Deck
  attr_reader :cards 
  
  def initialize(cards)
    @cards = cards 
  end 
  
  def count 
    @cards.count 
  end 
  
  def sort
    loop do 
      swapped = false 
        (count-1).times do |i|
        if cards[i].card_total > cards[i + 1].card_total
          @cards[i], @cards[i+1] = @cards[i + 1], @cards[i]
          swapped = true 
        end 
      end 
        break if not swapped 
    end
    @cards 
  end 
  
end 