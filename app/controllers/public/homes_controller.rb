class Public::HomesController < ApplicationController
    before_action :authenticate_user!
    
    def top
      @post = Post.new
      @posts = Post.page(params[:page]).reverse_order
      p @posts
    end
end
