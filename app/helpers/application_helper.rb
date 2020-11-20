# frozen_string_literal: true

# Module used for any application helper needs
module ApplicationHelper
  def header(text)
    content_for(:header) { text.to_s }
  end
end
