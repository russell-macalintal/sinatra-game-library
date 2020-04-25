class User < ActiveRecord::Base
  # has_many :games
  # has_many :consoles
  # --> Rewrite this relationship since Users can have many games and consoles but games and consoles can also each have many users.
  # --> Add join tables for has_many / has_many relationships between users and games, and between users and consoles.

  has_many :game_users
  has_many :games, through: :game_users

  has_many :console_users
  has_many :consoles, through: :console_users

  validates_uniqueness_of :username
  has_secure_password
end
