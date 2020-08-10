class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @roles = Role.select(:name, :id)
    default_role = Role.where(name: 'author').select(:name, :id)
    @user.role_id = default_role[0].id
  end

  def create
    # Create the user from params
    @user = User.new(user_params)
    if @user.save
      # Deliver the signup email
      # UserMailer.send_signup_email(@user).deliver
      redirect_to(@user, notice: 'User created')
    else
      render action: 'index'
    end
  end

  private
  def users_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :phone, :birth_date, :password, :email, :role_id)
  end
end
