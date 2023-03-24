class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show

  end

  def search
    if params[:search].blank?
      redirect_to users_url and return
    else
      @parameter = params[:search].downcase
      @search_users = UserSearch.search(@parameter)
    end
    @search_users
  end
end
