class UsersController < ApplicationController
  before_action :get_id, only: [:show]

  def show
  end

  def profile
    @user = User.find(params[:id])
    @favorites = Favorite.where(:user_id => @user.id)
  end
 # def edit
 # end

 # def update
 #   respond_to do |format|
 #     if @user.update(user_params)
 #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
 #       format.json { render :show, status: :ok, location: @user }
 #     else
  #      format.html { render :edit }
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  private
    def get_id
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:email,
                                   :encrypted_password,
                                   :admin,
                                   :image,
                                   :username)
    end
end
