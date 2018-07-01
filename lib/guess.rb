require './lib/card'

class Guess 
  attr_reader :response, :card 

  def initialize(response, card) 
     @response = response
     @card = card  
  end  
  
  def correct?
    if @response = "#{card.value} of #{card.suit}"
      true 
    else
      false 
    end 
  end 
  
  def feedback 
    if @response = "#{card.value} of #{card.suit}"
      "Correct!"
    else
      "Incorrect."
    end 
  end
  
  def incorrect?
    if @response != "#{card.value} of #{card.suit}"
      false
    else
      true 
    end
  end
  
  def feedback_incorrect
    if @response != "#{card.value} of #{card.suit}"
      "Incorrect."
    else 
      "Correct!"
    end 
  end 
  
end