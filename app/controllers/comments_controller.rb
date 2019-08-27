class CommentsController < ApplicationController
    
    def create 
        user = User.find(params[:user_id])
        unless user == current_user
          Comment.create(text: comment_params[:text], rate_id: comment_params[:rate_id], user_id: user.id)
        end
        redirect_to user
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:text, :rate_id)
    end
        
end
