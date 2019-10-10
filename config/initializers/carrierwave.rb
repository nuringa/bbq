require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:              'AWS',
        region:              'us-east-2',
        aws_access_key_id:     Bbq::Application.credentials.s3_access_key,
        aws_secret_access_key: Bbq::Application.credentials.s3_secret_key
    }

    config.fog_directory  = Bbq::Application.credentials.s3_bucket_name
  end
end
