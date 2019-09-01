class UsersController < ApplicationController
    before_action :redirect_top, except: [:index,:show]
    def index
        @users = User.search(params[:search]).page(params[:page]).per(6)
        @relationship = Relationship.new
        
        
            
            
    end
    
    def show
        @user = User.find(params[:id])
        @comment = Comment.new
        @comments = @user.comments.order("created_at DESC").page(params[:page]).per(10)
        @relationship = Relationship.new
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
