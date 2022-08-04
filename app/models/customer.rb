class Customer < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :product_plan
  has_many :leagues
end
