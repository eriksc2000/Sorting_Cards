require './lib/card'
require './lib/guess'

class Deck
  attr_reader :cards 
  
  def initialize(cards)
    @cards = cards 
  end 
  
end 