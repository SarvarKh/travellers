class Following < ApplicationRecord
    validates :follower_id, presence: true
    validates :followed_id, presence: true
end
