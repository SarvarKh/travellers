module OpinionsHelper
  def check_login
    if Current.user
      render partial: 'opinions/home'
    else
      render partial: 'shared/registration'
    end
  end

  def check_errors
    return unless @opinion.errors.any?

    tag.div tag.h5('Invalid input!')
    @opinion.errors.full_messages.each do |error|
      content_tag(:div, error, class: %w[alert alert-danger])
    end
  end

  def show_opinions(opinions)
    opinions.map do |opinion|
      content_tag :div, class: 'mb-3' do
        content_tag :div, class: 'row g-0 p-1' do
          concat(content_tag(:div, class: 'col-md-2') do
            tag('img', src: url_for(opinion.author.photo), class: %w[img-80 rounded]) if opinion.author.photo.attached?
          end)
          concat(content_tag(:div, class: 'col-md-10') do
            content_tag :div, class: 'card-body' do
              concat(content_tag(:h5, class: 'card-title') do
                       link_to(user_path(opinion.author.id)) do
                         concat(content_tag(:div, opinion.author.username, class: 'link-dark fw-bold'))
                       end
                     end)
              concat(content_tag(:h5, opinion.text, class: 'card-text'))
              concat(content_tag(:div, class: 'd-flex justify-content-between') do
                concat(content_tag(:p, class: 'card-text') do
                         concat(content_tag(:small, time_ago_in_words(opinion.created_at), class: 'text-muted'))
                       end)
                concat(content_tag(:div) do
                  concat(content_tag(:span, upvote_or_downvote(opinion)))
                  concat(content_tag(:i, '', class: 'fas fa-poll'))
                  concat(content_tag(:small, opinion.votes.count, class: 'text-muted'))
                end)
              end)
            end
          end)
        end
      end
    end.join.html_safe
  end
end
