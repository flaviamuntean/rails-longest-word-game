require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ("A".."Z").to_a.sample }
    return @letters
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    serialized_response = open(url).read
    @result = JSON.parse(serialized_response)
    @attempt_arr = @word.upcase.split(//)
  end
end
