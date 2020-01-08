class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
    @game_code = params[:game_code]
    @round = params[:round]
  end

  def create
    @submission = Submission.new(submission_params)
    @game_code = params[:game_code]
    @round = params[:round]
    @submission.user = current_user
    @submission.round = @round
    @submission.code = @game_code
    if @submission.save
      flash[:success] = "Your Thing has been submitted."
      redirect_to game_lobby_path(game_code: @game_code, round: @round)
    else
      flash[:danger] = "There was an issue submitting your Thing."
    end

  end

  

  private

  def submission_params
    params.require(:submission).permit(:user_id, :round, :submission, :guessed_correctly, :guesser, :code)
  end

end
