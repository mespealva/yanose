# frozen_string_literal: true

# Class that manages comments associated with a Post
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :body

  default_scope { order(updated_at: :asc) }
end
