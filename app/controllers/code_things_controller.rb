class CodeThingsController < ApplicationController

  def new

  end

  def create
    @code_thing = CodeThing.new
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    @round = params[:round]
    @thing = generate_random_thing()
    @code_thing.code_id = game_code_id
    @code_thing.round = @round
    @code_thing.thing_id = @thing.id
    if @code_thing.save
      flash[:success] = "Thing is below!"
      redirect_to select_a_thing_path(game_code: @game_code, round: @round, thing: @thing.id)
    else
      flash[:danger] = "There was a problem generating your Thing."
      redirect_to game_lobby_path(game_code: @game_code, round: @round)
    end
  end

  def update
    @game_code = params[:game_code]
    game_code_object = Code.find_by_code(@game_code)
    game_code_id = game_code_object.id
    @round = params[:round]
    @code_thing = CodeThing.where(code_id: game_code_id, round: @round)
    @thing = generate_random_thing()
    @code_thing.thing_id = @thing.id
    if @code_thing.save
      flash[:success] = "Here is your new Thing."
      redirect_to select_a_thing_path(game_code: @game_code, round: @round, thing: @thing.id)
    else
      flash[:success] = "There was a problem with your thing."
      redirect_to select_a_thing_path(game_code: @game_code, round: @round, thing: @thing.id)
    end
  end

  def generate_random_thing()
    Thing.order('RANDOM()').first
  end

end
