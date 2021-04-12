class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :photo, presence: true
  validates :cover_image, presence: true

  has_one_attached :photo
  has_one_attached :cover_image

  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
  has_many :votes
end
