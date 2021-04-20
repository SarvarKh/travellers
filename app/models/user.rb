class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true

  has_one_attached :photo, dependent: :destroy
  has_one_attached :cover_image, dependent: :destroy

  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id', dependent: :destroy
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy
  has_many :votes, dependent: :destroy
end
