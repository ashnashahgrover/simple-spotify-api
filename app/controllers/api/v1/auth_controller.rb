class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  #this is our login method 
  def create
    @user = User.find_by(username: user_login_params[:username])
    #in ruby, if the first statement before the && is false it will not even read the statement to the right
    #saving us from calling authenticate on nil and returning an error
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end
