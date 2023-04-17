class AuthController < ApplicationController
  # Viewing registration form
  def register_form
    @user = User.new
  end

  # Creating user
  def registration
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Registration successfully completed!"
      redirect_to root_path
    else
      render :register_form, status: :unprocessable_entity
    end
  end

  # Login Form
  def login_form
  end

  # Login
  def login
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Login successful!"
      redirect_to root_path
    end
  end

  # Logout
  def logout
    session[:user_id] = nil
    flash[:success] = "Logout successful!"
    redirect_to root_path
  end

  #Sanitizing form data
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
