module ApplicationHelper
    def follow_or_unfollow_friend_request(user)
        show_btns(user) unless Current.user == user
    end
    
    def show_btns(user)
      followed = Following.find_by(follower_id: Current.user.id, followed_id: user.id)
     if followed
        button_to(
         'Unfollow',
         following_path(id: followed.id, follower_id: Current.user.id, followed_id: user.id),
         method: :delete, class: 'btn unfollow'
       )
     else
       button_to(
         'Follow',
         followings_path(follower_id: Current.user.id, followed_id: user.id),
         method: :post, class: 'btn btn-primary'
         )
       end
    end
end
