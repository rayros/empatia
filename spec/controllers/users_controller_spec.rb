require 'spec_helper'

describe UsersController, :type => :controller do

  describe "GET index" do
    it "redirect to admin login page" do
      get :index
      expect(response).to redirect_to(new_admin_session_path)
    end
  end

end
