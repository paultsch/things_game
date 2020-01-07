class CodesController < ApplicationController

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    @code.gamecodes = generate_activation_code(4)
    if @code.save
      flash[:success] = "Your game code is #{@code.gamecodes}."
      redirect_to game_lobby_path(game_code: @code.gamecodes, round: 0)
    else
      flash[:danger] = "Your game code did not create."
      redirect_to root_path
    end
  end

  def generate_activation_code(size)
    charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

private

  def code_params
    params.permit(:gamecode)
  end

end
