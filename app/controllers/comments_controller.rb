class CommentsController < ApplicationController
    
    def create 
        @comment = Comment.create(text: comment_params[:text], user_id: current_user.id)
        @user = user.find(params[:id])
        redirect_to user_path(@comment.user)
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:text)
    end
end
