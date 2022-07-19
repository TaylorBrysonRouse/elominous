class AddLeagueIdToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :league, foreign_key: true, index: true
  end
end
