class ThingsController < ApplicationController

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(thing_params)
    if @thing.save
      flash[:success] = "Your thing was saved."
      redirect_to new_thing_path
    else
      flash[:danger] = "Your thing did not create."
      redirect_to new_thing_path
    end
  end

  def index
    @things = Thing.all
  end

private

    def thing_params
      params.require(:thing).permit(:thing)
    end


end
