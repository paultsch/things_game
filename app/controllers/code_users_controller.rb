class CodeUsersController < ApplicationController

  def create
    @code_user = CodeUser.new(code_user_params)
    upper_case_code = params[:game_code].upcase
    code_to_add = Code.find_by_code(upper_case_code)
    code_id_to_id = code_to_add.id
    if CodeUser.exists?(code_id: code_id_to_id, user_id: current_user.id)
      round_for_reload = CodeThing.find_by_sql "SELECT MAX(round) AS round FROM code_things WHERE code_id = #{code_id_to_id}"
      flash[:warning] = "You logged into a game that you had already logged into."
      redirect_to game_lobby_path(game_code: upper_case_code, round: round_for_reload.first.round)
    else
      if Code.exists?(id: code_to_add)
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
  end

private

def code_user_params
  params.permit(:user_id, :code_id, :score, :order)
end

end
