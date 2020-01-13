class BoardsController < ApplicationController
  before_action :authenticate_admin!, only: :index

  skip_before_action :authenticate_user!
  before_action :authenticate_user!, unless: :admin_signed_in?

  before_action :set_board, only: [:show, :edit, :update, :destroy, :activate]
  before_action only: [:show, :edit, :update, :destroy, :activate] do
    owns_organisation(@board.organisation)
  end

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @card = Card.new 
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.active = true

    unless user_signed_in?
      @board.organisation = Organisation.find(params[:board][:organisation_id])
    else
      @board.organisation = current_user.organisations.first
    end

    respond_to do |format|
      if @board.save
        format.html { redirect_to root_url, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    @board.active = !@board.active
    respond_to do |format|
      if @board.save
        format.html { redirect_back(fallback_location: board_path(@board)) }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :active, :creator_id)
    end
end
