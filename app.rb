# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/names' do
    @player_one = params['player_1_name']
    @player_two = params['player_2_name']

    erb :play
  end

  run! if app_file == $0
end
