module Admin
  class UsersController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
      @url = admin_users_path
    end

    def edit
      @url = admin_user_path(@user)
    end

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = t('admin.users.create.success')
        respond_with :edit, :admin, @user
      else
        flash[:warning] = @user.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :user
      end
    end

    def update
      if @user.update(user_params)
        flash[:notice] = t('admin.users.update.success')
        respond_with :edit, :admin, @user
      else
        flash[:warning] = @user.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :user
      end
    end

    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: t('admin.users.destroy.success') }
        format.json { head :no_content }
      end
    end

    private def set_user
      @user = User.find(params[:id])
    end

    private def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
  end
end
