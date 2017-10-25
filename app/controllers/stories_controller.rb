class StoriesController < ApplicationController
    def index 
        @stories=Story.all.order(created_at: :desc)
    end 
    def show 
        session[:story_id] = params[:id]
        @story=Story.find(params[:id])
        @entries=Entry.where(story_id: params[:id])
    end 
    
    def create
        @story=Story.new(story_helper)
        if @story.save 
          redirect_to '/'
        else 
            flash[:errors]=@story.errors.full_messages
            redirect_to '/'
        end 
      end 

    private
        def story_helper
            params.require(:story).permit(:title,:content).merge(user:current_user) if params[:story].present?
        end
end
