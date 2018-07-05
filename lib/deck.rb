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
  
  def merge_sort(deck)
    if deck.length <= 1
      deck 
    else 
      mid = (deck.length / 2).floor
      left = merge_sort(deck[0..mid - 1])
      right = merge_sort(deck[mid..deck.length])
      merge(left, right)
    end 
  end 
  
  def merge(left,right)
    if left.empty?
      right
    elsif right.empty?
      left 
    elsif left.first < right.first 
      [left.first] + merge(left[1..left.length], right)
    else 
      [right.first] + merge(left, right[1..right.length])
    end 
  end 
  
end 