class UsersController < ApplicationController
  def account
  end
  
  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name, :introduction, :icon))
      flash[:success] = "プロフィールを更新しました"
      redirect_to users_account_path
    else
      flash.keep[:danger] = "プロフィールを更新できませんでした"
      render users_profile_path
    end
  end
end
