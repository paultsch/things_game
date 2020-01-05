class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user = current_user
    if @submission.save
      flash[:success] = "Your Thing has been submitted."
      redirect_to game_lobby_path
    else
      flash[:danger] = "There was an issue submitting your Thing."
    end

  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :round, :submission, :guessed_correctly, :guesser,)
  end

end
