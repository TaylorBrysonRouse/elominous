class LeaguesController < ApplicationController
  before_action :set_league, only: %i[ show edit update destroy ]

  # GET /leagues
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  def show
    @league = League.find(params[:league_id])
  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues
  def create
    @league = League.new(league_params)

    if @league.save
      redirect_to @league, notice: "League was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leagues/1
  def update
    if @league.update(league_params)
      redirect_to @league, notice: "League was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /leagues/1
  def destroy
    @league.destroy
    redirect_to leagues_url, notice: "League was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:league_id])
    end

    # Only allow a list of trusted parameters through.
    def league_params
      params.fetch(:league, {})
    end
end
