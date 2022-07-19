class CreateCustomersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :product_plans do |t|
      t.string :name, null: false
    end
    
    create_table :customers do |t|
      t.string :name, null: false
      t.references :product_plan
      t.timestamps
    end

    add_foreign_key :customers, :product_plans, column: :product_plan_id, primary_key: :id
  end
end
