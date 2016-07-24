OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['SECRET_ID'], scope: 'public_profile', info_fields: 'id,name,link'
end
