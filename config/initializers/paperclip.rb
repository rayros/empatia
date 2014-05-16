# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:s3_host_name] = ENV['S3_ENDPOINT']

#Paperclip::Attachment.default_options[:s3_protocol] = 'https'
