# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot'

RSpec.describe Comment, type: :model do

  it 'Comment is persisted correctly using factory builder' do
    comment = FactoryBot.create(:comment)
    expect(comment).to be_valid
  end

  it 'Comment is invalid with a valid User and missing Post' do
    expect(FactoryBot.build(:comment, post: nil)).to_not be_valid
  end

  it 'Comment is invalid with a missing User and valid Post' do
    expect(FactoryBot.build(:comment, user: nil)).to_not be_valid
  end

  it 'Comment is not a valid Comment due to missing Comment body' do
    user = FactoryBot.build(:user)
    post = FactoryBot.build(:post, user: user)
    expect(FactoryBot.build(:comment, body: nil, user: user, post: post)).to_not be_valid
  end

  ############################################################
  #  NOTE: Since FactoryBot generates a random 'Post' record
  # using its internal factory values then to ensure the
  # correct and incorrect matching of 'Post' records are
  # guarenteed the creation of the 'Comment' record has
  # to take this into consideration for the next two tests
  # ###########################################################

  it 'Comment belongs to the correct Post' do
    post = FactoryBot.create(:post)
    comment = FactoryBot.create(:comment, post: post)
    expect(comment.post.id).to eq(post.id)
  end

  it 'Comment belongs to a different Post' do
    post = FactoryBot.create(:post)
    comment = FactoryBot.create(:comment)
    expect(comment.post.id).to_not eq(post.id)
  end

  ############################################################
  #  NOTE: Since FactoryBot generates a random 'User' record
  # using its internal factory values then to ensure the
  # correct and incorrect matching of 'User' recordsare
  # guarenteed the creation of the 'Comment' record has
  # to take this into consideration for the next two tests
  # ###########################################################
  it 'Comment belongs to the correct User' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user)
    comment = FactoryBot.create(:comment, post: post)
    expect(comment.post.user.id).to eq(user.id)
  end

  it 'Comment belongs to another User' do
    user = FactoryBot.create(:user)
    comment = FactoryBot.create(:comment)
    expect(comment.post.user.id).to_not eq(user.id)
  end

end
