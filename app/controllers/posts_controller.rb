require 'will_paginate/array'

class PostsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_filter :authenticate_admin!, only: [:mark_accepted, :mark_not_accepted]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  expose(:post, finder: :find_by_slug, attributes: :post_params)
  expose(:feed_posts) { Post.order("updated_at DESC").limit(20) }
  expose(:accepted_posts) { Post.accepted.paginate(page: params[:page])  }
  expose(:waiting_posts) { Post.waiting.paginate(page: params[:page]) }
  expose(:hotness_posts) { Post.hot.paginate(page: params[:page]) }
  expose(:top_posts) { Post.top.paginate(page: params[:page])}

  # GET /posts
  def index
    index_render accepted_posts
  end

  # GET /posts/(slug)
  def show
  end

  # GET /posts/new
  def new
  end
 
  # POST /posts 
  def create
    post.user = current_user if user_signed_in?
    if post.save
       redirect_to post, notice: 'Post was successfully created.'
    else
       render :new
    end
  end

  # GET /posts/(slug)/edit
  def edit
  end

  # PUT /posts/(slug)
  def update
    if post.save
      redirect_to post, notice: 'Post was successfully update.'
    else
      render :new
    end
  end

  # DELETE /posts/(slug)
  def destroy
    post.picture = nil
    post.save
    post.destroy
    redirect_to posts_path
  end

  # GET /posts/waiting_room
  def waiting_room
    index_render waiting_posts
  end
 
  # GET /posts/hotness 
  def hotness
    index_render hotness_posts
  end

  # GET /posts/top 
  def top
    index_render top_posts
  end

  # GET /posts/feed.rss
  def feed
    render 'posts/feed.rss', layout: false
  end

  # GET /posts/(slug)/fb_update
  def fb_update
    fql = Fql.execute("select comment_count, like_count, share_count, total_count 
                        from link_stat where url = '#{post_url(post)}'")
    post.update!(fql.first)
    render json: post
  end

  # GET /posts/(slug)/mark_accepted
  def mark_accepted
    post.accepted!
    redirect_to post, notice: 'Post accepted.'
  end

  # GET /posts/(slug)/mark_not_accepted
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

  def index_render posts
    respond_to do |format|
      format.html 
      format.xml { render :index, locals: { posts: posts } }
    end
  end
end
