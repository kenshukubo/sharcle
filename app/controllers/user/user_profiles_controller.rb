class User::UserProfilesController < User::ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update]
  # GET /user_profiles/1/edit
  def edit
    @user = current_user
    # @user_profile.update_zoom_profile!
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to edit_user_profile_path, notice: 'プロフィールを更新しました' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
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
      params.require(:user).permit(user_profile_attributes:[:id, :name])
    end
end