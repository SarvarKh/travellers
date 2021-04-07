class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :photo, presence: true
    validates :cover_image, presence: true

    has_many :opinions, class_name: "Opinion", foreign_key: "author_id"
end
