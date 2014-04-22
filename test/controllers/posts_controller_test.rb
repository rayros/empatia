require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:kwejk)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { title: @post.title, description: @post.description, picture: fixture_file_upload('sample-one.jpg', 'image/jpg') }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should edit post" do
    get :edit, id: @post
    assert_response :success
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
