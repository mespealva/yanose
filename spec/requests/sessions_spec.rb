# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot'

RSpec.describe 'Sessions' do
  before :each do
    @user = FactoryBot.create(:user)
  end

  it 'User creates sesssion and destroys session' do
    sign_in @user
    get root_path
    expect(response).to render_template(:index)

    sign_out @user
    get root_path
    expect(response).not_to render_template(:index)
  end

  it 'User creates a new account with valid data and no missing attributes' do
  end
end
