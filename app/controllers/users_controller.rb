class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :user

  respond_to :html, :xml, :json
  def show
  end

  def edit
  end

  def update
  	@user.update_attributes(params[:user])

  	respond_with @user
  end
end
