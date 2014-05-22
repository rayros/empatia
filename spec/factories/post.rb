require 'factory_girl'

def sample_file(filename = "sonic.png")
    File.new("app/assets/images/#{filename}")
end

FactoryGirl.define do
  factory :post do
    title "Random"
    description "MAMA"
    picture sample_file
  end
end
