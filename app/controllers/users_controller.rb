class UsersController < ApplicationController
 
    def show
        @user = User.find(params[:id])
    end
 
    def new
        @user = User.new
    end
 
    def create
        @user = User.new(user_params)
        # Rails.logger = Logger.new(STDOUT)       
        # Rails.logger.debug("–––––––––"+ @user.description)
        if @user.save
            sign_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            Rails.logger.debug(@user.errors.full_messages)
            render 'new'
        end
    end
 
    private
 
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
