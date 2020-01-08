class GamesController < ApplicationController
  def home

  end

  def gameLobby
    @game_code = params[:game_code]
    @game_code = @game_code.upcase
    @users = User.where(player: true)
    @round = params[:round].to_i
    @round = @round + 1
  end

  def guessingRound
    @users = User.where(player: true)
    @game_code = params[:game_code]
    @round = params[:round]
    @submissions = Submission.where(code: @game_code, round: @round)
  end

end
