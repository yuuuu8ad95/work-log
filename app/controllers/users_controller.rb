class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      sign_in(current_user, bypass: true)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password,
                                 :first_name, :family_name, :first_name_kana, :family_name_kana,
                                 :department_id, :birthday, :prefecture_id, :hobby, :free, :image)
  end
end
