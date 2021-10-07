# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'player'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_one] = Player.new(params['player_1_name'])
    session[:player_two] = Player.new(params['player_2_name'])

    redirect '/play'
  end

  get '/play' do
    @player_one_name = session[:player_one].name
    @player_two_name = session[:player_two].name

    erb :play
  end

  get '/attack' do
    @player_one_name = session[:player_one].name
    @player_two_name = session[:player_two].name

    erb :attack
  end

  run! if app_file == $0
end
