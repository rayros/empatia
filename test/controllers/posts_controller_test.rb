require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { title: @post.title, description: @post.description }
    end

    assert_redirected_to user_path(assigns(:user))
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

  test "should destroy user" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
