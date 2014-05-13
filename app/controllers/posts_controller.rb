class PostsController < ApplicationController
  before_filter :authenticate_admin!, only: [:mark_accepted]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  expose(:posts) { Post.find_by_accepted(true) }
  expose(:post, params: :post_params)
  expose(:waiting_posts) { Post.find_by_accepted(false) }
  def index
  end

  def edit
  end

  def show
  end

  def new
  end

  def destroy
    post.picture = nil
    post.save.destroy
    redirect_to :index
  end

  def update
    if post.save
      render :index
    else
      render :new
    end
  end

  def create
    post.user = current_user
    post.accepted = false
    if post.save
       redirect_to post, notice: 'Post was successfully created.'
    else
       render :new
    end
  end

  def waiting_room
    self.posts = waiting_posts
    render :index
  end

  def mark_accepted
    post.accepted!
    redirect_to post, notice: 'Post accepted.'
  end

 private
  def require_permission
    return if current_user.owner? post
    redirect_to :index
  end

  def post_params
    return if %w{mark_accepted}.include? action_name
    params.require(:post).permit(:title, :description, :picture)
  end
end
