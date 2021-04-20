require 'rails_helper'

RSpec.describe User do
  context 'when initialized' do
    subject(:user) { User.new }

    it 'is a new user' do
      expect(user).to be_a_new(User)
    end

    it 'is not a new string' do
      expect(user).not_to be_a_new(String)
    end
  end

  context 'when saved' do
    subject(:user) { User.create }

    it 'is not a new string' do
      expect(user).not_to be_a_new(String)
    end
  end
end
