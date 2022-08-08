class SportEloRating < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  attribute :elo_rating, default: 1000
end