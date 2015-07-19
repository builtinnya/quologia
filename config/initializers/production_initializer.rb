Rails.application.config.before_initialize do
  if Rails.env.production?
    Rails.application.secrets.secret_key_base = ENV['SECRET_KEY_BASE']
    Rails.application.secrets.twitter_api_key = ENV['TWITTER_CONSUMER_KEY']
    Rails.application.secrets.twitter_api_secret = ENV['TWITTER_CONSUMER_SECRET']
    Rails.application.secrets.facebook_api_id =  ENV['FACEBOOK_CONSUMER_ID']
    Rails.application.secrets.facebook_api_secret = ENV['FACEBOOK_CONSUMER_SECRET']
    Rails.application.secrets.github_client_id = ENV['GITHUB_CONSUMER_ID']
    Rails.application.secrets.github_client_secret = ENV['GITHUB_CONSUMER_SECRET']
  end
end
