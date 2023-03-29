class Account::UsersController < ApplicationController
  before_action :set_account_user, only: %i[ show edit update destroy ]

  # GET /account/users
  def index
    @account_users = User.all
  end

  # GET /account/users/1
  def show
  end

  # GET /account/users/new
  def new
    @account_user = User.new
  end

  # GET /account/users/1/edit
  def edit
  end

  # POST /account/users
  def create
    @account_user = User.new(account_user_params)

    if @account_user.save
      redirect_to @account_user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /account/users/1
  def update
    if @account_user.update(account_user_params)
      redirect_to @account_user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /account/users/1
  def destroy
    @account_user.destroy
    redirect_to account_users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_user
      @account_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_user_params
      params.fetch(:account_user, {})
    end
end
