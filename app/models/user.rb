class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

  has_many :articles, dependent: :destroy
  has_one  :user_profile, dependent: :destroy
  has_many :notifications, foreign_key: 'target_user_id', dependent: :destroy
  has_one  :user_notification, dependent: :destroy
end