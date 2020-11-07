class MemosController < ApplicationController

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  #def create
  #  @memo = Memo.new
  #  @memo.save
  #end



end
