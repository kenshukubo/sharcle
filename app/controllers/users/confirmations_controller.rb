# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # layout 'layouts/public/plain.html.erb'
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  def create
    super
    flash[:notice] = "確認用のメールを送信しました。ご確認ください。"
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    # super(resource_name, resource)
    new_user_session_path
  end
end
