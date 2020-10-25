class UsersController < ApplicationController
###render signup
    def new
        @user = User.new 
    end
###signup and redirect
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to anime_path(@user)
        else
            render :new 
        end
    end

    def show 
        @user = User.find_by_id(params[:id])
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
