class Game < ApplicationRecord
  validates :winner_id, presence: true
  validates :loser_id, presence: true
  validates :winner_score, presence: true
  validates :loser_score, presence: true
  
  belongs_to :winner, :class_name => "User"
  belongs_to :loser, :class_name => "User"
end