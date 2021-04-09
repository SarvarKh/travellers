class FollowingsController < ApplicationController
    def create
        @following = Current.user.followings.new(following_params)
        if @following.save
            redirect_to root_path, notice: "You started to follow a traveller."
        else
            render :new, alert: "You added invalid input!"
        end
    end

    def destroy
        following = Following.find_by(follower_id: Current.user.id, followed_id: params[:followed_id])
        
        if following
            following.destroy
            redirect_to root_path, notice: 'You unfollowed the tvaller.'
        else
            redirect_to root_path, alert: 'You cannot recall friend request that you recalled already.'
        end
    end

    private
    def following_params
        params.permit(:follower_id, :followed_id)
    end
end
