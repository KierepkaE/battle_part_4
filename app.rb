
require 'sinatra/base'
require 'sinatra'
require 'capybara/dsl'
require 'selenium-webdriver'
require_relative './lib/player.rb'
require_relative './lib/game.rb'
class Battle < Sinatra::Base

 enable :sessions


  get '/' do
    erb(:main)
  end

  post '/names' do
    $game = Game.new(params[:first_user],params[:second_user])
    redirect '/play'
  end

  get '/play' do
    @attack = params[:attack]
    @first_user_name = $game.player1.name
    @second_user_name = $game.player2.name
    @second_user_hp = $game.player2.HP
    @first_user_hp = $game.player1.HP
    if @first_user_hp != 0 && @second_user_hp != 0
      erb :play
    elsif  @first_user_hp == 0
      erb :second_user_win
    else
      erb :first_user_win
    end
  end

  post '/attack' do
    if params[:first_user_attack]
    $game.attack($game.player2)
    elsif params[:second_user_attack]
      $game.attack($game.player1)
    end
    redirect '/play?attack=true'
  end

  run! if app_file == $0

  set :session_secret, 'super secret'

end