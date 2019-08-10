
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
    @player1 = Player.new(params[:first_user])
    @player2 = Player.new(params[:second_user])
    @game = Game.create(@player1,@player2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    @attack = params[:attack]
    @first_user_name = @game.player1.name
    @second_user_name = @game.player2.name
    @second_user_hp = @game.player2.HP
    @first_user_hp = @game.player1.HP
    if @first_user_hp != 0 && @second_user_hp != 0
      erb :play
    elsif  @first_user_hp == 0
      erb :second_user_win
    else
      erb :first_user_win
    end
  end

  post '/attack' do
    @game = Game.instance
    if params[:first_user_attack]
    @game.attack(@game.player2)
    elsif params[:second_user_attack]
      @game.attack(@game.player1)
    end
    redirect '/play?attack=true'
  end

  run! if app_file == $0

  set :session_secret, 'super secret'

end