class SessionsController < ApplicationController
    
    def welcome
        
    end
###render login
    def new
        @user = User.new
        render :login 
    end
###login to show page 
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            redirect_to '/login'
        end
    end
###logout
    def destroy
        session.clear
        redirect_to '/'
    end


end
