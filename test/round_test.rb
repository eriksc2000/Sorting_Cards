require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test 
  
  def test_it_exists
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    
    assert_instance_of Round, round 
  end 
  
  def test_that_guesses_returns_empty_array
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    
    assert_equal [], round.guesses 
  end 
  
  def test_it_knows_current_card
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    
    assert_equal card_1, round.current_card
  end
  
  def test_it_records_a_guess
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})
    
    assert_equal "3 of Hearts", guess.response 
  end 
  
  def test_it_can_count_number_of_guesses
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.guesses.count 
  end 
  
  def test_it_can_guess_first_feedback 
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"}) 
    
    assert_equal "Correct!", round.guesses.first.feedback 
  end 
  
  def test_it_counts_number_of_correct_guesses
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"}) 
    
    assert_equal 1, round.number_correct
  end 
  
  def test_it_goes_to_next_card
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    
    assert_equal card_2, round.current_card
  end
  
  def test_it_records_second_guess
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})
    
    assert_equal "Jack of Diamonds", guess.response 
  end
  
  def test_it_adds_to_guess_count
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})
    guess = round.record_guess({value: "Jack", suit: "Diamonds"}) 
    
    assert_equal 2, round.guesses.count 
  end 
  
  def test_it_guesses_last_feedback
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})
    
    assert_equal "Incorrect.", round.guesses.last.feedback 
  end 

end