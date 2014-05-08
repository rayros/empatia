ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
  
  suckr = ImageSuckr::GoogleSuckr.new 
  suckr = suckr.get_image_file({"as_filetype" => "jpg"}) 
  open("test/fixtures/fake.jpg", "wb") do |file|
      file.write(suckr.read) 
  end

  def sample_file(filename = "sample-one.jpg")
    File.new("test/fixtures/#{filename}")
  end

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  # For sign_in and sign_out
  include Devise::TestHelpers
end
