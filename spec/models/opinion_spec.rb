require 'rails_helper'

RSpec.describe Opinion, type: :model do
    let(:user1) { User.create(username: 'Tom', full_name: 'Tom Hardy') }
    subject { Opinion.new(author: user1, text: "Travel is amazing and the most exciting thing!") }

    describe 'associations' do
      it { should belong_to(:author).class_name('User') }
    end

    describe 'validations' do
      it { should validate_presence_of(:text) }
      it { should validate_presence_of(:author_id) }
    end

    context 'Relations' do
      it 'User 1 tweets a message' do
        expect(subject.author).to eq(user1)
      end
    end
end