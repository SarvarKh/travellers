class VotesController < ApplicationController
  def create
    @vote = Current.user.votes.new(vote_params)
    if @vote.save
      redirect_to root_path
    else
      render :new, alert: 'You added invalid input!'
    end
  end

  def destroy
    vote = Vote.find_by(user_id: Current.user.id, opinion_id: params[:opinion_id])

    if vote
      vote.destroy
      redirect_to root_path
    else
      redirect_to root_path, alert: 'You cannot recall the vote that you recalled already.'
    end
  end

  private

  def vote_params
    params.permit(:user_id, :opinion_id)
  end
end
