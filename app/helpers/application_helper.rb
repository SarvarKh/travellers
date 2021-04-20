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

  def upvote_or_downvote(opinion)
    vote = Vote.find_by(user_id: Current.user.id, opinion_id: opinion.id)
    if vote
      button_to(
        'Downvote',
        vote_path(id: vote.id, user_id: Current.user.id, opinion_id: opinion.id),
        method: :delete, class: 'btn unfollow small'
      )
    else
      button_to(
        'Vote',
        votes_path(user_id: Current.user.id, opinion_id: opinion.id),
        method: :post, class: 'btn btn-success small'
      )
    end
  end

  def left_user_photo
    tag('img', src: url_for(Current.user.photo), class: %w[img-80 rounded]) if Current.user.photo.attached?
  end

  def login_navbar
    return unless Current.user

    content_tag :ul, class: 'navbar-nav text-black-50' do
      concat(content_tag(:li, class: 'nav-item pe-2') do
        link_to(edit_user_path(Current.user.id), class: 'btn p-2') do
          concat(content_tag(:i, ' ', class: 'fas fa-user-edit'))
        end
      end)
      concat(content_tag(:li, class: 'nav-item pe-2') do
        link_to(user_path(Current.user.id), class: 'btn p-2') do
          concat(content_tag(:i, ' ', class: 'fas fa-user'))
        end
      end)
      concat(content_tag(:li, class: 'nav-item pe-2') do
        link_to(logout_path, method: :delete, class: 'btn p-2') do
          concat(content_tag(:span, 'Log out'))
          concat(content_tag(:i, ' ', class: 'fas fa-door-open'))
        end
      end)
    end
  end

  def right_home
    return unless Current.user

    User.order(created_at: :desc).all.map do |user|
      content_tag :div, class: 'mb-3 right_home' do
        content_tag :div, class: 'row g-0' do
          concat(content_tag(:div, class: 'col-md-3') do
            tag('img', src: url_for(user.photo), class: %w[img-80 rounded]) if user.photo.attached?
          end)
          concat(content_tag(:div, class: 'col-md-9') do
            content_tag :div, class: 'card-body' do
              concat(content_tag(:div, class: 'd-flex justify-content-between mb-2') do
                concat(content_tag(:h5, class: 'card-title') do
                  link_to(user_path(user.id), class: 'link-dark fw-bold') do
                    concat(content_tag(:span, user.username))
                  end
                end)
                concat(content_tag(:div) { concat(content_tag(:span, follow_or_unfollow_friend_request(user))) })
              end)
              concat(content_tag(:p, class: 'card-text') do
                concat(content_tag(:small, time_ago_in_words(user.created_at), class: 'text-muted'))
              end)
            end
          end)
        end
      end
    end.join.html_safe
  end

  def right_user_photo
    return unless Current.user.photo.attached?

    tag('img', src: url_for(@user.photo), class: %w[img-100 rounded-circle mx-auto d-block])
  end

  def right_profile(user)
    user.followers.map do |f|
      content_tag :div, class: 'mb-1 right_home' do
        content_tag :div, class: 'row g-0 p-3' do
          concat(content_tag(:div, class: 'col-md-4') do
            tag('img', src: url_for(f.follower.photo), class: %w[img-80 rounded-circle mx-auto d-block])
          end)
          concat(content_tag(:div, class: 'col-md-8') do
            content_tag :div, class: 'card-body' do
              concat(content_tag(:div, class: 'card-title fw-bold') do
                concat(content_tag(:span, f.follower.full_name))
              end)
              concat(content_tag(:span, follow_or_unfollow_friend_request(f.follower)))
            end
          end)
        end
      end
    end.join.html_safe
  end
end
