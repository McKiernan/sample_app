class UsersController < ApplicationController
 
    before_action :signed_in_user, only: [:edit, :update]
    before_action :correct_user, only: [:edit, :update]

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
        #This is already set from correct_user, through the before filter
        #@user = User.find(params[:id])
    end

    def update
        #This is already set from correct_user, through the before filter
        #@user = User.find(params[:id]) 
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

    # Before filters

    def signed_in_user
        # redirect_to signin_url, notice: "Please sign in." unless signed_in?
        # This is equivalent to
        unless signed_in?
            store_location
            flash[:notice] = "Please sign in."
            redirect_to signin_url
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to root_url, notice: "Unauthorized access" unless current_user?(@user)
    end
end
