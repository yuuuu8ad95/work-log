class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @document = Document.find(params[:document_id])    
    @comment = @document.comments.build(comment_params)
    if @comment.save
      ActionCable.server.broadcast'comment_channel', content: @comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, document_id: params[@document.id])
  end
end
