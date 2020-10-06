class DocumentsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index]
  def index
    @documents = Document.all.order('created_at DESC')
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to document_path
    else
      render :new
    end
  end

  def show
    @document = Document.new
    @document = Document.find(params[:id])
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update(document_params)
      redirect_to document_path(@document.id)
    else
      render :edit
    end
  end

  def destroy
    @document = Document.find(params[:id])
    if @document.destroy
      redirect_to root_path
    else
      redirect_to document_path
    end
  end 




  private

  def document_params
    params.require(:document).permit(:create_day, :title, :content, :deadline).merge(user_id: current_user.id)
  end
end

def move_to_index
  redirect_to new_user_session_path unless user_signed_in?
end
