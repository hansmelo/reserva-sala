class Room < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :day, presence: true
  validates :hour, presence: true
end
