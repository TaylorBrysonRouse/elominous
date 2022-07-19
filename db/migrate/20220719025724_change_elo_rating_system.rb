class ChangeEloRatingSystem < ActiveRecord::Migration[7.0]
  def change
    create_table :sport_elo_ratings, id: false do |t|
      t.references :user, null: false
      t.references :sport, null: false
      t.integer :elo_rating, null: false
    end

    add_foreign_key :sport_elo_ratings, :users, column: :user_id, foreign_key: :id
    add_foreign_key :sport_elo_ratings, :sports, column: :sport_id, foreign_key: :id
  end
end
