class PostsController < ApplicationController
    before_action :redirect_top, except: :show
    def new 
        @story = Story.find(params[:story_id])
        @post = Post.new 
    end
    
    def create 
        @story = Story.find(params[:story_id])
        @post = Post.create(post_params)
        redirect_to story_post_path(@story,@post)
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    private
    
    def post_params
        params.require(:post).permit(:text, :title, :story_id)
    end
end
