class UsersController < ApplicationController
    def index
        # flash.now[:notice] = "Logged in successfully"
        # flash.now[:alert] = "Invalid email"

        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path, notice: "Successfully created account!"
        else
            flash
            render :new
        end
        
    end

    private
    def user_params
        params.require(:user).
            permit(:username, :full_name, :photo, :cover_image)
    end
end
