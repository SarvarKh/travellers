class Opinion < ApplicationRecord
  validates :author_id, presence: true
  validates :text, presence: true

  belongs_to :author, class_name: 'User'
  has_many :votes
end
