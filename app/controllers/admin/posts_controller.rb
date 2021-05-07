class Admin::PostsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_user_posts_path(@post.user)
  end
end
