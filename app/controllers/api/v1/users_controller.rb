class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    # fetch all users
    @users = User.all
    render json: @users, status: 200
  end

  def current
    render json: current_user
  end

  def show
    # fetch single user
    render json: @user, status: 200
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
