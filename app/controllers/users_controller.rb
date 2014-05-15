class UsersController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :destroy]
  expose(:user)
  expose(:users) { User.all.paginate(page: params[:page]) }
  expose(:posts) { Post.where(user: user,accepted: true).paginate(page: params[:page]) }
  def index
  end

  def show
    self.posts = user.posts.paginate(page: params[:page]).order(:accepted) if admin_signed_in?
    self.posts = current_user.posts.paginate(page: params[:page]).order(:accepted) if user_signed_in?
  end
  def destroy
    user.destroy
    redirect_to users_path
  end
end
