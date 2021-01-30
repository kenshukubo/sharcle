class UserNotification < ApplicationRecord
  belongs_to :user
  validates :unchecked_num, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end