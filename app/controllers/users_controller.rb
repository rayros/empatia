class UsersController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :destroy]
  expose(:user)
  expose(:users) { User.all.paginate(page: params[:page]) }
  expose(:posts) { Post.user_accepted(user).paginate(page: params[:page]) }
  
  # GET /users only for admins
  def index
  end

  # GET /users/(id)
  def show
    self.posts = user.posts.order(:accepted).paginate(page: params[:page]) if admin_signed_in?
    self.posts = current_user.posts.order(:accepted).paginate(page: params[:page]) if user_signed_in?
  end

  # DELETE /users/(id)
  def destroy
    user.destroy
    redirect_to users_path
  end
end
