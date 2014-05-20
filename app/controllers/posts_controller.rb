require 'will_paginate/array'

class PostsController < ApplicationController
  before_filter :authenticate_admin!, only: [:mark_accepted, :mark_not_accepted]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  expose(:post, finder: :find_by_slug, attributes: :post_params)
  expose(:accepted_posts) { Post.accepted.paginate(page: params[:page])  }
  expose(:waiting_posts) { Post.waiting.paginate(page: params[:page]) }
  expose(:hotness_posts) { Post.hot.paginate(page: params[:page]) }
  expose(:top_posts) { Post.top.paginate(page: params[:page])}
  def index
    respond_to do |format|
      format.html 
      format.xml          
    end
  end

  def waiting_room
  end
  
  def hotness
  end
 
  def top
  end

  def edit
  end

  def show
  end

  def new
  end

  def destroy
    post.picture = nil
    post.save
    post.destroy
    redirect_to posts_path
  end

  def update
    if post.save
      render :index
    else
      render :new
    end
  end

  def fb_update
    fql = Fql.execute("select comment_count, like_count, share_count, total_count 
                        from link_stat where url = '#{post_url(post)}'")
    post.update!(fql.first)
    render json: post
  end
  
  def create
    post.user = current_user if user_signed_in?
    post.accepted = false
    if post.save
       redirect_to post, notice: 'Post was successfully created.'
    else
       render :new
    end
  end


  def mark_accepted
    post.accepted!
    redirect_to post, notice: 'Post accepted.'
  end

  def mark_not_accepted
    post.not_accepted!
    redirect_to post, notice: 'Post not accepted.'
  end

  private
  def require_permission
    return if admin_signed_in? 
    return if current_user and current_user.owner? post
    redirect_to root_path
  end

  def post_params
    return if %w{mark_accepted mark_not_accepted}.include? action_name
    params.require(:post).permit(:title, :description, :picture)
  end
end
