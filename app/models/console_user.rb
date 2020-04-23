class ConsoleUser < ActiveRecord::Base
  belongs_to :console
  belongs_to :user
end
