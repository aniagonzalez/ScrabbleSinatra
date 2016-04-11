require 'sinatra'
require_relative 'lib/Scoring'

class MyApp < Sinatra::Base
  # HELPERS ##
  helpers do
    def active_page?(path='')
      request.path_info == '/' + path
    end
  end
  ################
  

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @scored_word = Scoring.score(params["word1"])
    @letter_hashes = Scoring.letter_hashes(params["word1"])
    erb :score
  end

  get '/how-many' do
    erb :how_many
  end

  post '/score-many' do
    @number = params["number"].to_i
    if params["all_words"].nil? == false
      @scored_words = Scoring.multiple_word_hashes(params["all_words"])
    end
    erb :score_many
  end



run!
end
