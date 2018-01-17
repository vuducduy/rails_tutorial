class CommentsController < ApplicationController
  before_action :load_comment, only: [:edit, :update]
  def create
    @comment = Comment.new comment_params
    if @comment.save
      respond_to do |format|
        format.html
        format.js
        format.json
      end
    else
      respond_to do |format|
        format.html
        format.js
        format.json
      end
    end
  end

  def edit

  end

  def update
    if @comment.update_attributes comment_params
      flash[:success] =  "update comment successfully"
      redirect_to @comment.post
    else
      flash.now[:danger] = "update comment failed"
      render :edit
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit :user_id, :post_id, :content
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    redirect_to root_path unless @comment
  end
end
