class LikesController < ApplicationController
  before_action :logged_in_user
  def create
    @like = Like.new like_params
    @like.user = current_user
    if @like.save
      flash[:success]="liked"
      redirect_to @like.post
    else
      flash[:danger]="Not success"
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
  end

  private
  def like_params
    params.require(:like).permit :post_id
  end
end
