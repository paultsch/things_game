class GamesController < ApplicationController
  def home

  end

  def gameLobby
    @users = User.where(player: true)
    @game_code = params[:game_code]
    @round = params[:round].to_i
    @round = @round + 1
  end

  def guessingRound
    @game_code = params[:game_code]
    @round = params[:round]
  end

  def updateRound

  end

end
