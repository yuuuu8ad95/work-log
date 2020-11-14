class MarksController < ApplicationController
  def create
    @mark = current_user.marks.create(document_id: params[:document_id])
    redirect_back(fallback_location: root_path)
    @mark.save
    @document.create_notification_mark!(current_user)
  end

  def destroy
    @mark = current_user.marks.find_by(document_id: params[:document_id], user_id: current_user.id)
    @mark.destroy
    redirect_back(fallback_location: root_path)
  end
end
