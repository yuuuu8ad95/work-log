class CommentsController < ApplicationController
  def new
    @documents = Document.all
    @document = Dovument.new
  end

  def create
    @document = Document.new(comment_params)
  end

  private

  def coment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, document_id: params[@document.id])
  end
end
