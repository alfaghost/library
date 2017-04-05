class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:edit, :update, :destroy, :index, :show,]


  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.role == '1'
      @user.role = 'admin'
    end
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

  def user_params
     params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :role)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
