# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end


ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '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', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'yourdomain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}