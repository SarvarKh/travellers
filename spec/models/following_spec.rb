require 'rails_helper'

RSpec.describe Following, type: :model do
    let(:user1) { User.create(username: 'Tom', full_name: 'Tom Hardy') }
    let(:user2) { User.create(username: 'Mark', full_name: 'Mark Zuckerberg') }
    subject { Following.new(follower: user1, followed: user2) }

    describe 'associations' do
      it { should belong_to(:follower).class_name('User') }
      it { should belong_to(:followed).class_name('User') }
    end

    describe 'validations' do
      it { should validate_presence_of(:follower_id) }
      it { should validate_presence_of(:followed_id) }
    end

    context 'Relations' do
      it 'User 1 follows User 2' do
        expect(subject.followed).to eq(user2)
      end
      it 'User 2 is followed by User 1' do
        expect(subject.follower).to eq(user1)
      end
    end
end