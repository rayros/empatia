require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "anonim should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts), 'Obiekt posts powinnien istnieć'
    assert flash.empty?
  end

  test "anonim should get show post" do
    get :show
    assert_response :success
    assert_not_nil assigns(:post), 'Obiekt post powinnien istnieć'
  end
end
