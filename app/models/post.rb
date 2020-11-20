# frozen_string_literal: true

# Base class for managing Posts
class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments
  validates_presence_of :title, :body

  default_scope { order(updated_at: :desc) }
end
