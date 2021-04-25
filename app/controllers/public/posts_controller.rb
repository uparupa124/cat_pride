class Public::PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    @post.save
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.user_id == current_user.id
     @post.destroy
     redirect_to user_path(current_user)
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:image, :body)
    end
end
