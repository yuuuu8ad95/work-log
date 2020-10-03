class DocumentsController < ApplicationController
  def index
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :content, :deadline).merge(user_id: current_user.id)
  end
end
