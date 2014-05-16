# config/initializers/paperclip.rb
#Paperclip::Attachment.default_options[:s3_host_name] = ENV['S3_ENDPOINT']

#Paperclip::Attachment.default_options[:s3_protocol] = 'https'
Paperclip::Attachment.default_options[:path] = ':class/:attachment/:id_partition/:basename:style.:extension'
