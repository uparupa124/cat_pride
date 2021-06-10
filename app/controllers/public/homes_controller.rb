class Public::HomesController < ApplicationController
    before_action :authenticate_user!, except: [:about]
    
    def top
      @post = Post.new
      @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).reverse_order
    end
    
    def all_posts
      @post = Post.new
      @posts = Post.page(params[:page]).reverse_order
    end
    
    def favorite_posts
      @post = Post.new
      @favorites = current_user.favorites.page(params[:page]).reverse_order
     
      @favorites.each do |favorite|
        @posts = favorite.post
      end
      
    end
    
    def about
    end
end
