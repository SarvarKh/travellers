class Vote < ApplicationRecord
  belongs_to :opinion
  belongs_to :user
end
