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
  
  def test_it_has_a_response
    card = Card.new('10', 'Hearts')
    guess = Guess.new('10 of Hearts', card)
    
    assert_equal '10 of Hearts', guess.response 
  end
  
  def test_it_has_correct_guess
    card = Card.new('10', 'Hearts')
    guess = Guess.new('10 of Hearts', card)
    
    assert_equal true, guess.correct? 
  end 
  
  def test_it_has_correct_feedback
    card = Card.new('10', 'Hearts')
    guess = Guess.new('10 of Hearts', card)
    
    assert_equal "Correct!", guess.feedback 
  end 
  
  def test_it_has_incorrect_guess
    card = Card.new('Queen', 'Clubs')
    guess = Guess.new('2 of Diamonds', card)
    
    assert_equal false, guess.correct?
  end
  
  def test_it_has_incorrect_feedback
    card = Card.new('Queen', 'Clubs')
    guess = Guess.new('2 of Diamonds', card)
    
    assert_equal "Incorrect.", guess.feedback
  end 
    
end
