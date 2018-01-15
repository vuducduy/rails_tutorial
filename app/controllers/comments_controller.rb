class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    if @comment.save
      flash[:success] = "Create Comment successfully"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger]= "Create Comment failed"
      redirect_back(fallback_location: root_path)
    end

  end

  private

  def comment_params
    params.require(:comment).permit :user_id, :post_id, :content
  end
end
