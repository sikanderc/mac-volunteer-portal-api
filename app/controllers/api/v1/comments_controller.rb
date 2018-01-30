class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:update]

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      render json: {status: 'Comment was successfully updated.'}, status: :201
    else
      render json: { message: "Error. Error. Please try again."}, status: 400
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
