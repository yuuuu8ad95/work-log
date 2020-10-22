class DocumentsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index]
  before_action :set_document, only: [:edit, :update, :destroy]

  def index
    @documents = Document.all.order('created_at DESC')
    @documents = params[:tag_id].present? ? Tag.find(params[:tag_id]).documents : Document.all
  end

  def new
    @document = DocumentsTag.new
  end

  def create
    @document = DocumentsTag.new(documents_tag_params)
    if @document.valid?
      @document.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @comment = Comment.new
    @mark = Mark.new
    @document = Document.find(params[:id])
  end

  def edit    
  end

  def update
   if @document.update(document_params)
      redirect_to documents_path
    else
      render :edit
    end
  end

  def destroy
    if @document.destroy
      redirect_to root_path
    else
      redirect_to document_path
    end
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
  end


  private

  def documents_tag_params
    params.require(:documents_tag).permit(:create_day,:title, :content, :deadline, :name, :tag_ids).merge(user_id: current_user.id)
  end

  def document_params
    params.permit(:title, :content, :deadline).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_document
    @document = Document.find_by(id:params[:id])
  end
end
