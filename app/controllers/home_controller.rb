class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
 
  def new

  end

  def waiting_room
    @posts = Post.find_by_accepted(false)
    render :index
  end

  def show

  end
end
