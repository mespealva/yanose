# frozen_string_literal: true

# Class used for handling email functionality
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
