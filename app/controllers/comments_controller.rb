class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @document = Document.new(comment_params)
  end

  private

  def coment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, document_id: params[@document.id])
  end
end
