class OpinionsController < ApplicationController
  def index
    @opinion = Current.user.opinions.new if Current.user
    @opinions = Opinion.order(created_at: :desc).all.includes(:author)
  end

  def new
    @opinion = Current.user.opinions.new
  end

  def create
    @opinion = Current.user.opinions.new(opinion_params)

    if @opinion.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:author_id, :text)
  end
end
