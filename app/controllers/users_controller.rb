class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :ban]
  load_and_authorize_resource only: [:new, :destroy, :edit, :update, :ban]

  layout 'simple', only: [:show, :edit]

  def index
    @users = User.alphabetical.page(params[:page]).per(50)
  end

  def show
    # authorize! :read, @user
  end

  def edit
    @social = Social.create(name: :twitter)
    # authorize! :update, @user
  end

  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, bypass: true)
        format.html { redirect_to @user, notice: t('users.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] # && params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, bypass: true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

=begin
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
=end

  def ban
    if @user.role == 'user'
      @user.update(role: 'banned')
      redirect_to @user, notice: "user забанен"
    else
      @user.update(role: 'user')
      redirect_to @user, notice: "user разбанен"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [:name, :email, :image, :sex, :description, :wallpapers] # extend with your own params
    accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
