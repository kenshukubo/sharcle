class Article < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :og_title, presence: true
  validates :og_url, presence: true
end