class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
    @game = Game.find(params[:id])
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    respond_to do |format|  
      if @game.save
        winner = User.find(params[:game][:winner_id])
        loser = User.find(params[:game][:loser_id])
        EloService.elo_score_generator(winner, loser)
        winner.save!
        loser.save!
        format.html { redirect_to games_url, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity}
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.fetch(:game, {}).permit(:winner_id, :winner_score, :loser_id, :loser_score)
    end
end
