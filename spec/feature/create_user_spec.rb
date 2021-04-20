require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  scenario 'valid inputs' do
    visit root_path
    click_link 'Sign up'
    fill_in 'user[username]', with: 'David'
    fill_in 'user[full_name]', with: 'David Jones'
    click_on 'Sign up'
    visit root_path
    expect(page).to have_content('David Jones')
  end
end
