class UsersController < ApplicationController

  before_action :find_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:create]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :internal_server_error
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: :internal_server_error
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.permit(:user_name, :name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
