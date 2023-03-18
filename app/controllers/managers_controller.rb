class ManagersController < ApplicationController

  before_action :find_manager, only: [:show, :update]
  before_action :authenticate_manager, only: [:update]

  def index
    @managers = Manager.all
    render json: @managers, status: :ok
  end

  def show
    render json: @manager, status: :ok
  end

  def create
    @manager = Manager.new(manager_params)

    if (@current_user.manager = @manager)
      return render json: { errors: 'User already has manager account' }, status: :conflict
    end

    @manager.user = @current_user
    if @manager.save
      render json: @manager, status: :created
    else
      render json: { errors: @manager.errors.full_messages }, status: :internal_server_error
    end
  end

  def update
    if @manager.update(manager_params)
      render json: @manager
    else
      render json: { errors: @manager.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def manager_params
    params.permit(:name, :country, :fave_team)
  end

  def find_manager
    @manager = Manager.find(params[:id])
  end

  def authenticate_manager
    if @current_user != @manager.user
      render json: { errors: ['Cannot update manager associated with different user'] }, status: 403
    end
  end

end
