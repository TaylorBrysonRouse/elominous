class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :current_customer

  has_and_belongs_to_many :customers
  has_many :sport_elo_ratings, class_name: 'SportEloRating', foreign_key: 'user_id' do
    def sport(sport_string)
      sport = Sport.find_by(sport: sport_string)
      find_by(sport_id: sport.id)
    end
  end
  has_many :wins, :class_name => 'Game', :foreign_key => 'winner_id'
  has_many :losses, :class_name => 'Game', :foreign_key => 'loser_id'

  validates :first_name, presence: true
  validates :last_name, presence: true

  def formatted_name
    "#{self.first_name} #{self.last_name}" 
  end

  def customer
    @current_customer
  end

  def current_customer_id
    @current_customer.id
  end
end
