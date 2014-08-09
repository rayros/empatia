require 'spec_helper'

describe PostsController, :type => :controller do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
  describe 'GET waiting_room' do
    it 'renders the waiting_room template' do
      get :waiting_room
      expect(response).to render_template('waiting_room')
    end
  end
  describe 'GET hotness' do
    it 'renders the waiting_room template' do
      get :hotness
      expect(response).to render_template('hotness')
    end
  end
  describe 'GET top' do
    it 'renders the top template' do
      get :top
      expect(response).to render_template('top')
    end
  end
  describe 'GET feed' do
    it 'renders the feed.rss template' do
      get :feed
      expect(response).to render_template('posts/feed.rss')
    end
  end
  context 'admin is singed in' do
    let(:admin) { create(:admin) }
    let(:new_post) { create(:post) }
    before do
      sign_in admin
    end
    describe 'GET mark_accepted' do
      it 'should accepted this post and redirect to it' do
        get :mark_accepted, { id: new_post.to_param }
        expect(Post.find(new_post.id).accepted).to be true
        expect(response).to redirect_to(post_url(new_post))
      end
    end
    describe 'GET mark_not_accepted' do
      it 'should not accepted this post and redirect to it' do
        get :mark_not_accepted, { id: new_post.to_param }
        expect(Post.find(new_post.id).accepted).to be false
        expect(response).to redirect_to(post_url(new_post))
      end
    end
  end
  context 'user is singed in' do
    let(:user) { create(:user) }
    let(:user_post) { create(:post, user: user) }
    before do
      sign_in user
    end
    describe 'PUT update' do 
      describe 'with valid params' do
        it 'redirect to post page' do
          put :update, { id: user_post.to_param, post: { title: 'new_title' } } 
          expect(response).to redirect_to(post_url(Post.find(user_post.id)))
        end
      end
      describe 'with invalid params' do
        it 'render new post form' do
          put :update, { id: user_post.to_param, post: { title: '' } } 
          expect(response).to render_template('new')
        end
      end
    end
    describe 'DELETE destroy' do
      it 'destroy user post' do
        sign_in user
        path = user_post.picture.path
        puts path
        expect { delete :destroy, { id: user_post.slug } }.to change(Post, :count).by(-1)
        expect(File).not_to exist(path)
        expect(Post).not_to exist(id: user_post.id)
        expect(response).to redirect_to(root_path)
      end
    end
  end
  context 'user is not singed in' do
    describe 'POST create' do
      before do
        Post.destroy_all
      end
      let(:attributes) { attributes_for(:post, 
        picture: fixture_file_upload(Rails.root.join("app/assets/images/sonic.png"), 'image/png')) } 
      
      describe 'with valid params' do 
        it 'redirects to post page' do
          expect { post :create, post: attributes }.to change(Post, :count).by(1)
          expect(response).to redirect_to(post_url(Post.last)) 
        end
      end
      describe 'with invalid params' do
        it 'render new post form' do
          invalid_attributes = attributes
          invalid_attributes[:title] = nil
          expect { post :create, post: invalid_attributes }.to change(Post, :count).by(0)
          expect(response).to render_template('new')
        end
      end
    end
    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_post) { create(:post) }
        it 'redirect to user login page' do
          put :update, { id: new_post.to_param, post: { title: 'new_title' } } 
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end
