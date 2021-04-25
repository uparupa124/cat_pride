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
  
  private
    def post_params
      params.require(:post).permit(:image, :body)
    end
end
