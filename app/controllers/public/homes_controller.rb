class Public::HomesController < ApplicationController
    before_action :authenticate_user!
    
    def top
      @post = Post.new
      @posts = Post.all
    end
end
