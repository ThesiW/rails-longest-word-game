class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = 10.times.map { alphabet.sample }.join.upcase
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    # word.chars.all? { |letter| word.count(letter) <= grid.count(letter) }
    if @word.include?(@letters) && test(@word)
      @score = 1
    else
      @score = ':( Your score is: 0'
    end
  end

  def test(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)

    json['found']
  end
end

# The word cant be built out of the original grid
# The word is valid according to the grid, but is not a valid English word
# The word is valid according to the grid and is an English word
