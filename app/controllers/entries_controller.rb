class EntriesController < ApplicationController
    def create
        @entry=Entry.new(entry_helper)
        if @entry.save 
          redirect_to :back
        else 
            flash[:errors]=@entry.errors.full_messages
            redirect_to :back
        end 
      end 

    private
        def entry_helper
            params.require(:entry).permit(:content).merge(user:current_user,story:current_story) if params[:entry].present?
        end
end
