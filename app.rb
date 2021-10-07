# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_one = Player.new(params['player_1_name'])
    player_two = Player.new(params['player_2_name'])
    session[:game] = Game.new(player_one, player_two)

    redirect '/play'
  end

  get '/play' do
    @game = session[:game]

    erb :play
  end

  get '/attack' do
    @game = session[:game]

    @game.attack(@game.player_two)

    erb :attack
  end

  run! if app_file == $0
end
