class UsersController < ApplicationController
  layout 'application_show'
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all

  end

  def show
      @user = User.find(params[:id])
      @images = @user.images.order(id: "DESC")
  end


end
