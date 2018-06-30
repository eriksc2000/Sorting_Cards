require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test 

  def test_it_exists
    card = Card.new('10', 'Hearts')
    guess = Guess.new('10 of Hearts', card)
    
    assert_instance_of Guess, guess 
  end

end
