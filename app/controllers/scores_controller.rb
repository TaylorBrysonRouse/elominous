class ScoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @user_game_record = game_record(@user)
    @user_match_record = match_record(@user)
  end

  # Opponent ID is passed and gets the Users record from when they played that User
  def show
    @user = User.find(params[:user_id])
    @opponent = User.find(params[:opponent_id])

    @user_game_record = specefic_game_record(@user, @opponent)
    @user_match_record = specefic_match_record(@user, @opponent)
  end

  protected
  
  def game_record(user)
    wins = user.wins
    losses = user.losses
    win_record = 0
    loss_record = 0

    wins.each do |win|
      win_record += win.winner_score
      loss_record += win.loser_score
    end

    losses.each do |loss|
      win_record += loss.loser_score
      loss_record += loss.winner_score
    end

    record = "#{win_record}-#{loss_record}"
  end

  def specefic_game_record(user, opponent)
    wins = user.wins.where("loser_id = #{opponent.id}")
    losses = user.losses.where("winner_id = #{opponent.id}")
    win_record = 0
    loss_record = 0

    wins.each do |win|
      win_record += win.winner_score
      loss_record += win.loser_score
    end

    losses.each do |loss|
      win_record += loss.loser_score
      loss_record += loss.winner_score
    end

    record = "#{win_record}-#{loss_record}"
  end

  def match_record(user)
    wins = user.wins.count
    losses = user.losses.count
    record = "#{wins}-#{losses}"
  end

  def specefic_match_record(user, opponent)
    wins = user.wins.where("loser_id = #{opponent.id}").count
    losses = user.losses.where("winner_id = #{opponent.id}").count
    record = "#{wins}-#{losses}"
  end
end