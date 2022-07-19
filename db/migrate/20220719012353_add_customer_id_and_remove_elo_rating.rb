class AddCustomerIdAndRemoveEloRating < ActiveRecord::Migration[7.0]
  def up
    remove_column :users, :elo_rating
  end

  def down
    add_column :users, :customer_id
  end
end
