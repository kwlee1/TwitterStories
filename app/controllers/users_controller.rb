class UsersController < ApplicationController
    def index
    end

    def new
    end 

    def create
        @user = User.new(reg_helper)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/' 
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to '/users'
        end
    end 

    private
    def reg_helper
        params.require(:user).permit(:username,:email,:password) if params[:user].present?
    end
end
