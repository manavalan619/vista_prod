CarrierWave.configure do |config|
  # config.storage = :file

  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  end

  if Rails.env.staging? || Rails.env.production?
    config.asset_host = ENV.fetch('CARRIERWAVE_ASSET_HOST')
    config.asset_host_public = true

    config.cache_dir = "#{Rails.root}/tmp/uploads"

    # NB: possible Heroku workaround for re-displays
    # config.root           = Rails.root.join('tmp') # adding these...
    # config.cache_dir      = 'carrierwave' # ...two lines

    config.storage    = :aws
    config.aws_bucket = ENV['AWS_BUCKET_NAME']
    config.aws_acl    = 'public-read'

    # The maximum period for authenticated_urls is only 7 days.
    # config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    # Set custom options such as cache control to leverage browser caching
    config.aws_attributes = {
      cache_control: "public, max-age=#{365.day.to_i}"
    }

    config.aws_credentials = {
      access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region:            ENV['AWS_REGION']
      # stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
    }

    # Optional: Signing of download urls, e.g. for serving private content through
    # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
    # configured:
    # config.aws_signer = -> (unsigned_url, options) do
    #   Aws::CF::Signer.sign_url(unsigned_url, options)
    # end
  end
end
