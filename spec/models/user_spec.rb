require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_one_attached(:photo) }
    it { should have_one_attached(:cover_image) }
    it { should have_many(:followers), foreign_key: :followed_id, class_name: :Following }
    it { should have_many(:followings), foreign_key: :follower_id, class_name: :Following }
    it { should have_many(:opinions), foreign_key: :autho_id, class_name: :Opinion }
    it { should have_many(:votes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:full_name) }
  end

  context 'with name Marcel' do
    it 'follows user with name Gary' do
      user1 = User.create(username: 'Marcel', full_name: 'Marcel Krause')
      user2 = User.create(username: 'Gary', full_name: 'Gary Thomas')

      user1.followings.create!(follower_id: user1.id, followed_id: user2.id)

      expect(User.find(user1.followings.first.followed_id).username).to eq('Gary')
    end
  end
end
