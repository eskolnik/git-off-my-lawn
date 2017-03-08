class WelcomeController < ApplicationController
  def index
    @name = Lawn.owner
  end
end
