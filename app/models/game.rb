class Game < ActiveRecord::Base
  # belongs_to :user
  # --> Rewrite this relationship since games can have many users
  # --> Add join tables for has_many / has_many relationship between users and games.

  has_many :game_users
  has_many :users, through: :game_users

  belongs_to :category
  belongs_to :developer
end
