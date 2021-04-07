class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        user = User.find_by(username: params[:username])
        if user.present?
            session[:user_id] = user.id
            redirect_to root_path, notice: "Successfully logged in!"
        else
            flash[:alert] = "Invalid username"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out"
    end
end
