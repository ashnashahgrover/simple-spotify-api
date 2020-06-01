class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    byebug
    if @user.valid?
      render json: {user: UserSerializer.new(@user)}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end
end

#I forgot what the controller does

#cannot use query params in POSTMAN because of strong params
