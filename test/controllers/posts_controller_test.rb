require 'test_helper'

class PostsControllerTest < ActionController::TestCase
 
  setup do
    @user = users(:bob)
    @admin = admins(:olo)
    @post = posts(:kwejk)
    @picture = fixture_file_upload("fake.jpg","image/jpg") 
  end
 

  test "anonim should not get index" do
    get :index
    assert_redirected_to new_admin_session_path
  end


  test "user should not get index" do
    sign_in :user, @user
    get :index
    assert_redirected_to new_admin_session_path
  end


  test "admin should get index" do
    sign_in :admin, @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "anonim should not create post" do
    assert_no_difference('Post.count') do
      create_post
    end
    assert_redirected_to new_admin_session_path
  end

  test "user should not create post" do
    sign_in :user, @user
    assert_no_difference('Post.count') do
      create_post
    end
    assert_redirected_to new_admin_session_path
  end

  test "admin should create post" do
    sign_in :admin, @admin
    assert_difference('Post.count') do
      create_post 
    end
    assert_redirected_to post_path(assigns(:post))
  end

  test "admin should edit post" do
    sign_in :admin, @admin
    get :edit, id: @post
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "user should not show post" do
    sign_in :user, @user
    get :show, id: @post
    assert_redirected_to new_admin_session_path
  end

  test "anonim should not show post" do
    get :show, id: @post
    assert_redirected_to new_admin_session_path
  end

  test "admin should new post" do
    sign_in :admin, @admin
    get :new, id: @post
    assert_response :success
  end

  test "user should not new post" do
    sign_in :user, @user
    get :new, id: @post
    assert_redirected_to new_admin_session_path
  end

  test "anonim should not new post" do
    get :new, id: @post
    assert_redirected_to new_admin_session_path
  end

  test "admin should destroy post" do
    sign_in :admin, @admin
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to posts_path
  end

  test "user should not destroy post" do
    sign_in :user, @user
    assert_no_difference('Post.count') do
      delete :destroy, id: @post
    end
    assert_redirected_to new_admin_session_path
  end

  test "anonim should not destroy post" do
    assert_no_difference('Post.count') do
      delete :destroy, id: @post
    end
    assert_redirected_to new_admin_session_path
  end

  private

  def create_post
       post :create, post: {
        title: Faker::Name.title,
        description: Faker::Lorem.paragraph,
        picture: @picture 
        }   
  end

end
