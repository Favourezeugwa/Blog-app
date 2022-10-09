class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def api_token
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render :json => @user.api_token, :status => :ok}
      format.html {}
    end
  end
end
