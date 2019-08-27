class UsersController < ApplicationController
    
    def index
        @users = User.order("RAND()").page(params[:page]).per(6)
    end
    
    def show
        @user = User.find(params[:id])
        @comment = Comment.new
        @comments = @user.comments.order("created_at DESC").page(params[:page]).per(10)
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
