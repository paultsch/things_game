class GamesController < ApplicationController
  def home

  end

  def gameLobby
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    # @users = Submission.find_by_sql "SELECT code_id, guesser_id, COUNT(*) as score FROM submissions WHERE code_id = #{game_code_id} AND guesser_id NOT null GROUP BY guesser_id"
    @users = Submission.find_by_sql "SELECT c.user_id, COUNT(s.guesser_id) AS score FROM code_users c LEFT JOIN submissions s ON c.user_id = s.guesser_id WHERE c.code_id = #{game_code_id} GROUP BY c.user_id"
    @startUsers = CodeUser.find_by_sql "SELECT user_id FROM code_users WHERE code_id = #{game_code_id}"
    @round = params[:round].to_i
    @round = @round + 1
    @score = Submission.where(code: @game_code, guesser_id: 2).count
  end

  # "SELECT c.user_id, COUNT(s.guesser_id) AS score FROM code_users c LEFT JOIN submissions s ON c.user_id = s.guesser_id WHERE c.code_id = #{game_code_id} GROUP BY c.user_id"


  def guessingRound
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    # @users = CodeUser.where(code_id: game_code_id)
    @users = CodeUser.find_by_sql "SELECT c.user_id, u.username FROM code_users c INNER JOIN users u ON c.user_id = u.id WHERE code_id = #{game_code_id}"
    @round = params[:round]
    @submissions = Submission.where(code_id: game_code_id, round: @round)
  end

  def update_guessingRound
    @game_code = params[:game_code]
    @round = params[:round]
    Submission.update(params[:submissions].keys, params[:submissions].values)
    redirect_to game_lobby_path(game_code: @game_code, round: @round)
  end


end
