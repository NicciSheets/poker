require 'sinatra'
require_relative "poker_game.rb"

enable :sessions

get '/' do
  erb :poker
end

post '/poker' do
	redirect '/'
end