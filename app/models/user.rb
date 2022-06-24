class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wins, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :losses, :class_name => 'Game', :foreign_key => 'loser_id'

  validates :first_name, presence: true
  validates :last_name, presence: true

  attribute :elo_rating, default: 1000
end
