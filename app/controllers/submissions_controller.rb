class SubmissionsController < ApplicationController

  def new
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    @round = params[:round].to_i
    @thing = CodeThing.where(code_id: game_code_id, round: params[:round])

    if CodeThing.exists?(code_id: game_code_id, round: params[:round])
      @submission = Submission.new
    else
      flash[:danger] = "The next round has not started. Tell the game admin to click \"Select a Thing\""
      @round = @round - 1
      redirect_to game_lobby_path(game_code: @game_code, round: @round)
    end
  end

  def create
    @submission = Submission.new(submission_params)
    @game_code = params[:game_code]
    game_code_id = Code.find_by_code(@game_code).id
    @round = params[:round]
    @submission.user = current_user
    @submission.round = @round
    @submission.code_id = game_code_id
    if @submission.save
      flash[:success] = "Your Thing has been submitted."
      redirect_to game_lobby_path(game_code: @game_code, round: @round)
    else
      flash[:danger] = "There was an issue submitting your Thing."
    end

  end



  private

  def submission_params
    params.require(:submission).permit(:user_id, :round, :submission, :guessed_correctly, :guesser_id, :code_id)
  end

end
