class UserProfile < ApplicationRecord
  belongs_to :user
  validates :identified_char, presence: true, uniqueness: true
  validates :name, presence: true, length: {maximum: 20}
  validates :introduction, length: {maximum: 800}
end