class HomeController < ApplicationController
  def index
    @boards = Board.where(organisation: current_user.organisations.first)
  end
end
