class GamesController < ApplicationController
  def home

  end

  def gameLobby
    @users = User.where(player: true)
    @game_code = generate_activation_code(4)
  end

  def guessingRound

  end

  def updateRound

  end

  def generate_activation_code(size)
    charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end

end
