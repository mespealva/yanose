# frozen_string_literal: true

require 'spec_helper'
require 'factory_bot'

describe 'the signin process', type: :feature do
  before :each do
    @user = FactoryBot.create(:user)
  end

  it 'signs me in' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
