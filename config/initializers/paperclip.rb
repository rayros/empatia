# config/initializers/paperclip.rb
#Paperclip::Attachment.default_options[:s3_host_name] = ENV['S3_ENDPOINT']

#Paperclip::Attachment.default_options[:s3_protocol] = 'https'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip.interpolates(:s3_eu_url) do |att, style| 
"#{att.s3_protocol}://s3-website-eu-west-1.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
end
