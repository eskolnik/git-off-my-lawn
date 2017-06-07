class LawnsController < ApplicationController
  def index
    @lawns = Lawn.all
    @lawn = Lawn.new
  end

  def show
    @lawn = Lawn.find(params["id"])
    @name = @lawn.name
  end

  def create
    Lawn.create(lawn_params)
    redirect_to lawns_path
  end

  def lawn_params
    params.require(:lawn).permit(:name)
  end

end
