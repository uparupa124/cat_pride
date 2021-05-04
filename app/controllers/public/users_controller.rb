class Public::UsersController < ApplicationController
 
 before_action :authenticate_user!
    
    
    def followings
     @user = User.find(params[:id])
    end
     
    def followers
     @user = User.find(params[:id])
     p @user
    end
    
    def show
     @user = User.find(params[:id])
     p @user.posts
    end
    
    def edit
     @user = User.find(params[:id])
    end
    
    def update
     @user = User.find(params[:id])
     
     if @user.update(user_params)
      redirect_to user_path
     else
      render "edit"
     end
    end
    
    def withdrawal
     @user = User.find(params[:id])
    end
    
    def destroy
     @user = User.find(params[:id])
     
     if @user == current_user
       @user.destroy
       redirect_to new_user_session_path
     end
    end
    
    private
     def user_params
        params.require(:user).permit(:user_name, :introduction, :email, :telephone_number, :profile_image)
     end
end
