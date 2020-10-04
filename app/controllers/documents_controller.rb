class DocumentsController < ApplicationController
  def index
    @documents = Document.all.order('created_at DESC')
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

  def show
    @document = Document.new
    @document = Document.find(params[:id])
  end

  private

  def document_params
    params.require(:document).permit(:create_day, :title, :content, :deadline).merge(user_id: current_user.id)
  end
end
