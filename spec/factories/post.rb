require 'factory_girl'

def sample_file(filename: "sonic.png")
    File.new("#{Rails.root}/spec/images/#{filename}")
end

FactoryGirl.define do
  factory :post do
    title "Test picture."
    description "Test picture."
    picture sample_file
  end
end
