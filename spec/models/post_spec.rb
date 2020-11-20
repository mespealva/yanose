# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot'

RSpec.describe Post, type: :model do

  it 'Post is persisted correctly using factory builder' do
    post = FactoryBot.build(:post)
    expect(post).to be_valid
  end

  it 'Post is invalid because of missing title' do
    expect(FactoryBot.build(:post, title: nil, body: "Test body")).to_not be_valid
  end

  it 'Post is invalid because of missing body' do
    expect(FactoryBot.build(:post, title: "Test Title", body: nil)).to_not be_valid
  end

  ############################################################
  #  NOTE: Since FactoryBot generates a random 'User' record
  # using its internal factory values then to ensure the
  # correct and incorrect matching of 'User' records are
  # guarenteed the creation of the 'Post' record has
  # to take this into consideration for the next two tests
  # ###########################################################

  it 'Verify Post belongs to the correct user' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)
    verify_post = Post.find(post.id)
    expect(user).to eq(verify_post.user)
  end

  it 'Verify Post belongs to a different user' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    verify_post = Post.find(post.id)
    expect(user).to_not eq(verify_post.user)
  end

end
