class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_FROM_ADDRESS'] || 'manavalan@10decoders.in'
  layout 'mailer'
end
