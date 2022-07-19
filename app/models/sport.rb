class Sport < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :sport_elo_ratings
end