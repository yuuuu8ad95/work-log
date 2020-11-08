class MemosController < ApplicationController

  def index
    @memos = Memo.all.order('created_at DESC')
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.valid?
      @memo.save
      redirect_to user_memos_path
    else
      render 'new'
    end
  end

  private
  def memo_params
    params.require(:memo).permit(:text).merge(user_id: current_user.id)
  end



end
