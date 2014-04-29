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

    def edit
        # Rails.logger = Logger.new(STDOUT)
        # Rails.logger.debug("----Params: " + params.inspect)
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        Rails.logger = Logger.new(STDOUT)
        # Rails.logger.debug("----Params: " + params.inspect)
        # Rails.logger.debug("----User: " + @user.inspect)

        if @user.update_attributes(user_params)
            Rails.logger.info(" %%%%%%%%%%%%%%%%User update successfully")
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            Rails.logger.info(@user.errors.messages.inspect)
            render 'edit'
        end
    end
 
    private
 
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
