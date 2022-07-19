class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :customers
  has_many :sport_elo_ratings, class_name: 'SportEloRating', foreign_key: 'user_id'
  has_many :wins, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :losses, :class_name => 'Game', :foreign_key => 'loser_id'

  validates :first_name, presence: true
  validates :last_name, presence: true

  def formatted_name
    "#{self.first_name} #{self.last_name}" 
  end
end
