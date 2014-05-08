require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #test "should not create post without title and description" do
  #  post = Post.new
  #  post.picture = sample_file("sample-one.jpg")
  #  assert post.save
  #end
  
  test "should create post" do
    kwejk = posts(:kwejk)
    post = Post.new
    assert_not post.save, "Saved this post empty"
    post.title = kwejk.title
    assert_not post.save, "Saved this post with a title"
    post.description = kwejk.description
    assert_not post.save, "Saved this post with a title and description"
    post.picture = sample_file
    assert post.save, "should create post"

  end

end
