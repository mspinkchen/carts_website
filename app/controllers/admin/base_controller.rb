class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  private

  def authenticate_admin
    if !current_user.admin?
      flash[alert]="not allowed"
      redirect_to root_path
    end
  end
end
