class User::UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update]

  def edit
    @user = current_user
  end

  def update
    if @user_profile.update(user_profile_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to edit_user_profile_path
    else
      flash[:notice] = "プロフィールに失敗しました"
      redirect_to edit_user_profile_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = current_user.user_profile
      # @user_profile = UserProfile.find_by(identified_char: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:name)
    end
end