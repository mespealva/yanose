# frozen_string_literal: true

# Base class for database interation introduced in Rails 5+
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
