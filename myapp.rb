require 'sinatra'
require_relative 'lib/Scoring'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @scored_words = Scoring.new(params["scorewords"])
    erb :score
  end

  get '/score_many' do
    erb :score_many
  end

  post '/score_many' do
    @scored_words = Scoring.new(params["scorewords"])
    erb :score_many
  end

run!
end
