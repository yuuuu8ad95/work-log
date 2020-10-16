class MarksController < ApplicationController
  def create
    @mark = Mark.new
    @mark.save
end
