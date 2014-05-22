require 'spec_helper'
describe PostsController do
  describe "GET 'index'" do
    before(:all) do
      Post.destroy_all
      @posts = create_list(:post, 4)
    end

    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

#    it "loads all of the posts into @posts" do
#     get :index
#     expect(assigns(:posts)).to eq(@posts)
#   end

  end

  describe "GET 'new'" do

    it "returns http succes" do
      get :new
      expect(response).to be_success
    end

    it "render the new template" do
      get :new
      expect(response).to render_template("new")
    end

  end

#  describe "GET 'waiting_room'" do
#    before(:each) do
#      get :waiting_room
#    end

#    it "returns http succes" do
#      expect(response).to be_success
#    end

#    it "render the waiting_room template" do
#      expect(response).to render_template("index")
#    end

#    it "loads all of waiting posts into @posts" do
#      expect(assigns(:posts)).to eq( Post.find_by_accepted(false))
#    end
#  end

#  describe "POST 'create'" do
#    it "create post" do
#      post_params = attributes_for(:post)
#     expect { post :create, :post => post_params }.to change(Post, :count).by(1)
#    end
#  end
end
