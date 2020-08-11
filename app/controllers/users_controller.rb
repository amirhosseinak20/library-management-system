class UsersController < ApplicationController
  include ApplicationHelper
  before_action :can_show_profile?, only: [:show]

  def index
    @users = if current_user
               User.all
             else
               User.joins(:role).where(role: {name: 'author'})
             end
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

  def can_show_profile?
    unless params[:id] && numeric?(params[:id]) && (User.joins(:role).where(id: params[:id], roles: {name: 'author'})[0] || current_user.id == params[:id].to_i)
      redirect_to request.referer || request.base_url, notice: 'This user doesn\'t have public profile!'
    end
  end
end
