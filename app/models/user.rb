class User < ApplicationRecord
    validates :username, presence: true
    validates :full_name, presence: true
    validates :photo, presence: true
    validates :cover_image, presence: true
end
