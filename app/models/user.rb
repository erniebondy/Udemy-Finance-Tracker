class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :friendships
  has_many :friends, through: :friendships

  ## validates :username, presence: true, uniqueness: { case_sensitive: false },
  ##                     length: { minimum: 3, maximum: 15 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def full_name
    first_name || last_name ? "#{first_name} #{last_name}" : "Anonymous"
  end

  def stock_already_tracked?(ticker)
    !stocks.find_by(ticker: ticker).nil?
  end

  def under_stock_limit?
    ### We can use 'stocks' without qualifying the User
    ### since we are in the User class
    stocks.count < 10
  end

  def can_track_stock?(ticker)
    under_stock_limit? && !stock_already_tracked?(ticker)
  end
end
