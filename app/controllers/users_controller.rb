class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit 
    end
    
    def update
        current_user.update(update_params)
        redirect_to user_path(current_user)
    end
    
    private
    def update_params
        params.require(:user).permit(:nickname, :image)
    end
end
