class WelcomeController < ApplicationController
  def index
    @name = Lawn.owner || "Nobody"
  end
end
