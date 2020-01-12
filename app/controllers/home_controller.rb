class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user!, unless: :admin_signed_in?

  def index
    if admin_signed_in?
      @boards = Board.all
    else
      @boards = Board.where(organisation: current_user.organisations.first)
    end
  end
end
