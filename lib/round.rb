require './lib/card'
require './lib/guess'
require './lib/deck'
require 'pry'

class Round 
  attr_reader :deck, :guesses, :correct_guess 
  
  def initialize(deck)
    @deck = deck 
    @guesses = []
    @correct_guess = 0
  end 
  
  def current_card
    deck.cards[0]
  end 
  
  def record_guess(response)
    response = "#{response [:value]} of #{[:suit]}"
    guess = Guess.new(response, current_card)
    @guesses << guess
    if guess == "Correct!"
      @correct_guess += 1
    end 
     guess 
  end

end