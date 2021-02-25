require 'set'

class WelcomeController < ApplicationController
  def index
    if params.has_key?(:amount) and !params[:amount].empty?
      amount = params.require(:amount).to_i
    else
      amount = 5
    end
    
    @lotto_groupOfNumbers = generate_lotto(amount)
    @amount = amount
  end

  private
  def generate_lotto(amount)
    groupOfNumbers = []
    for i in (1..amount) do
      groupOfNumbers[i-1] = generate_lotto_number()
    end
    return groupOfNumbers
  end

  private
  def generate_lotto_number()
    picks = Set.new
    for i in (1..6) do
      randomNum = rand(1..45)
      while picks.member?(randomNum) do 
        randomNum = rand(1..45)
      end
      picks.add(randomNum)
    end
    return picks
  end

end
