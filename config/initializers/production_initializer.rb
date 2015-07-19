Rails.application.config.before_initialize do
  if Rails.env.production?
    Rails.application.secrets.secret_key_base = ENV['SECRET_KEY_BASE']
    Rails.application.secrets.twitter_api_key = ENV['TWITTER_CONSUMER_KEY']
    Rails.application.secrets.twitter_api_secret = ENV['TWITTER_CONSUMER_SECRET']
    Rails.application.secrets.facebook_api_id =  ENV['FACEBOOK_CONSUMER_ID']
    Rails.application.secrets.facebook_api_secret = ENV['FACEBOOK_CONSUMER_SECRET']
    Rails.application.secrets.github_client_id = ENV['GITHUB_CONSUMER_ID']
    Rails.application.secrets.github_client_secret = ENV['GITHUB_CONSUMER_SECRET']

    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV['S3_KEY'],
        aws_secret_access_key: ENV['S3_SECRET'],
        region:                ENV['S3_REGION'],
      }
      config.fog_directory  = ENV['S3_BUCKET_NAME']
      config.fog_public     = true
    end
  end
end
