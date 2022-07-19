class MigrationsForGamesAndEloRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :sport, null: false
    end

    create_table :leagues do |t|
      t.string :name, null: false
      t.references :customer, null: false
      t.references :sport, null: false
    end
    add_foreign_key :leagues, :customers, column: :customer_id, primary_key: :id
    add_foreign_key :leagues, :sports, column: :sport_id, primary_key: :id
  end
end
