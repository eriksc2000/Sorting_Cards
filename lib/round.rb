require './lib/card'
require './lib/guess'
require './lib/deck'
require 'pry'

class Round 
  attr_reader :deck, 
              :guesses, 
              :number_correct 
  
  def initialize(deck)
    @deck = deck 
    @guesses = []
    @number_correct = 0
  end 
  
  def current_card
    deck.cards[0]
  end 
  
  def record_guess(response)
    card_values = "#{response[:value]} of #{response[:suit]}"
    guess = Guess.new(card_values, current_card)
    @guesses << guess 
    if guess.feedback == "Correct!"
    @number_correct += 1
    end
    deck.cards.shift
    guess 
  end  

end