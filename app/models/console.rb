class Console < ActiveRecord::Base
  # belongs_to :user
  # --> Rewrite this relationship since consoles can have many users.
  # --> Add join tables for has_many / has_many relationships between users and consoles.

  has_many :console_users
  has_many :users, through: :console_users
end
