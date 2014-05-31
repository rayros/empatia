class UsersController < ApplicationController
  before_filter :authenticate_admin!, only: [:index, :destroy]
  expose(:user)
  expose(:users) { User.all.paginate(page: params[:page]) }
  expose(:posts) { user.posts.accepted.paginate(page: params[:page]) }
  
  # GET /users only for admins
  def index
  end

  # GET /users/(id)
  def show
    if user == current_user or admin_signed_in?
      self.posts = user.posts.order(:accepted).paginate(page: params[:page])
    end
  end

  # DELETE /users/(id)
  def destroy
    user.destroy
    redirect_to users_path
  end
end
