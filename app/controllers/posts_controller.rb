class PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post, only: [:show, :edit, :destroy]
  def index
    @posts = Post.all
  end

  def edit
  end

  def show
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.picture = nil
    @post.save.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
 private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :picture)
  end
end
