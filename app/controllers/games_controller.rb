class GamesController < ApplicationController
  def home

  end

  def gameLobby
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    @users = Submission.find_by_sql "SELECT c.user_id, COUNT(s.guesser_id) AS score FROM code_users c LEFT JOIN submissions s ON c.user_id = s.guesser_id WHERE c.code_id = #{game_code_id} GROUP BY c.user_id"
    @round = params[:round].to_i
    @round = @round + 1
  end

  def guessingRound
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    @users = CodeUser.find_by_sql "SELECT c.user_id, u.username FROM code_users c INNER JOIN users u ON c.user_id = u.id WHERE code_id = #{game_code_id}"
    @round = params[:round]
    #@submissions = Submission.find_by_sql "SELECT * FROM submissions WHERE code_id = #{game_code_id} AND round = #{@round} AND guessed_correctly IS NOT TRUE"
    @submissions = Submission.where(code_id: game_code_id, round: @round, guessed_correctly: [nil, false])

    @submissionsDone = Submission.where(code_id: game_code_id, round: @round, guessed_correctly: true)
  end

  def update_guessingRound
    @game_code = params[:game_code]
    @round = params[:round]
    Submission.update(params[:submissions].keys, params[:submissions].values)
    redirect_to guessing_round_path(game_code: @game_code, round: @round)
  end

  def update_guessingRoundMidRound
    @game_code = params[:game_code]
    @round = params[:round]
    Submission.update(params[:submissionsDone].keys, params[:submissionsDone].values)
    redirect_to guessing_round_path(game_code: @game_code, round: @round)
  end

  def selectAThing
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    @round = params[:round]
    @thing = CodeThing.where(code_id: game_code_id, round: params[:round])
  end

  def end_game
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    codething_to_delete = CodeThing.where(code_id: game_code_id)
    submissions_to_delete = Submission.where(code_id: game_code_id)
    codeuser_to_delete = CodeUser.where(code_id: game_code_id)
    code_to_delete = Code.where(id: game_code_id)
    codething_to_delete.delete_all
    submissions_to_delete.delete_all
    codeuser_to_delete.delete_all
    code_to_delete.delete_all
    flash[:success] = "Your game has ended"
    redirect_to root_path
  end

end
