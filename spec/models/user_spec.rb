require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with name Marcel' do
    it 'follows user with name Gary' do
      user1 = User.create(username: 'Marcel', full_name: 'Marcel Krause')
      user2 = User.create(username: 'Gary', full_name: 'Gary Thomas')

      user1.followings.create!(follower_id: user1.id, followed_id: user2.id)

      expect(User.find(user1.followings.first.followed_id).username).to eq('Gary')
    end
  end
end
