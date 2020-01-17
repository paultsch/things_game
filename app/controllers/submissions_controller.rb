class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    @round = params[:round]
    @thing = CodeThing.where(code_id: game_code_id, round: params[:round])
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
