class StoriesController < ApplicationController
    before_action :redirect_top, except: [:index,:show]
    def index 
        @stories = Story.includes(:user).search(params[:search]).page(params[:page]).per(6)
    end
    
    def new 
        @story = Story.new
    end 
    
    
    def create 
        @story = Story.create(title: story_params[:title], image: story_params[:image], text: story_params[:text], user_id: current_user.id)
        redirect_to story_path(@story)
    end

    
    def show
        @story = Story.find(params[:id])
    end
    
    private
    def story_params
        params.require(:story).permit(:title, :image, :text)
    end
    
    
end
