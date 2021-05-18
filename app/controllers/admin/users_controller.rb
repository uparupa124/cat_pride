class Admin::UsersController < ApplicationController
 
 before_action :authenticate_admin!
 
    def show
      @user = User.find(params[:id])
    end
    
   def edit
      @user = User.find(params[:id])
   end
   
   def update
      @user = User.find(params[:id])
      @user.update!(user_params)
      redirect_to admin_user_path
   end
    
   def destroy
     @user = User.find(params[:id])
     @user.destroy
     redirect_to "/admin"
   end
    
    private
      def user_params
        params.require(:user).permit(:full_name, :email, :telephone_number)
      end
end
