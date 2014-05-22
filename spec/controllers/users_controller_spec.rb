require 'spec_helper'

describe UsersController do
  before(:all) do
    User.destroy_all
    @user = create(:user)
  end

  describe "GET 'index'" do
    it "returns http redirect" do
      get 'index'
      response.should be_redirect
    end
  end

  describe "GET 'posts'" do
    it "returns http success" do
      get 'show', id: @user.id
      response.should be_success
    end
  end

end
