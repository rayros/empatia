module HomeHelpers
  def sample_file(filename = "sample-one.jpg")
    File.new("test/fixtures/#{filename}")
  end
end


