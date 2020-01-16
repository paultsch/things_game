class CodeUsersController < ApplicationController

  def create
    @code_user = CodeUser.new(code_user_params)
    upper_case_code = params[:game_code].upcase
    code_to_add = Code.find_by_code(upper_case_code)
    if Code.exists?(id: code_to_add)
      code_id_to_id = code_to_add.id
      @code_user.user_id = current_user.id
      @code_user.code_id = code_id_to_id
      if @code_user.save
        flash[:success] = "You have logged in."
        redirect_to game_lobby_path(game_code: upper_case_code, round: 0)
      else
        flash[:danger] = "That code exists but there was an issue logging you in."
      end
    else
      flash[:danger] = "Code does not exist"
      redirect_to root_path
    end
  end

private

def code_user_params
  params.permit(:user_id, :code_id, :score, :order)
end

end
