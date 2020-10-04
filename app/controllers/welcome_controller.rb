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
      numbers = []
      for num in (0..5) do
        numbers[num] = rand(1..45)
      end
      numbers = numbers.sort()
      groupOfNumbers[i-1] = numbers
    end
    return groupOfNumbers
  end
end
