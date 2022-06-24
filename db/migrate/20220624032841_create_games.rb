class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :winner, null: false
      t.integer :winner_score, null: false
      t.references :loser, null: false
      t.integer :loser_score, null: false      
      t.timestamps
    end
    add_foreign_key :games, :users, column: :winner_id, primary_key: :id
    add_foreign_key :games, :users, column: :loser_id, primary_key: :id
  end
end
