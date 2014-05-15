require 'factory_girl'
  def sample_file(filename = "sample-one.jpg")
    File.new("spec/support/#{filename}")
  end
FactoryGirl.define do
  factory :post do
    title "Random"
    description "MAMA"
    picture sample_file
  end
end
