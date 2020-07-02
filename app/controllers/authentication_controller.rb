# frozen_string_literal: true

class AuthenticationController < ApplicationController


  # POST /auth/login
  def show; end

  def login
    if(:current_user) 
      session.delete(:current_user) 
    end
    @user = User.find_by(username: params[:username])
    p @user.password != params[:password]
    if !(@user && @user.password == params[:password])
      redirect_to '/auth/login', notice: 'Usuario/contraseña invalidos'
    else
        session[:current_user] = @user
        redirect_to '/home'
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
