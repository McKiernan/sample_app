class UsersController < ApplicationController
    before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user, only: :destroy

    def show
        @user = User.find(params[:id])
        #@curUser = current_user
        #puts "SHOW: Cur user"
        #puts @curUser.name
        @microposts = @user.microposts.paginate(page: params[:page], per_page: 10) # Per page limit
    end

    def index
        @users = User.paginate(page: params[:page])
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

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted."
        redirect_to users_url
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
            # Rails.logger.info(" %%%%%%%%%%%%%%%%User update successfully")
            flash[:success] = "Profile updated"
            redirect_to @user
        else
            puts "Failed to update"
            Rails.logger.info(@user.errors.messages.inspect)
            render 'edit'
        end
    end
 
    private
 
    def user_params
        params.require(:user).permit(:name, :email, 
            :password, :password_confirmation)
    end

    # Before filters

    def correct_user
        @user = User.find(params[:id])
        #redirect_to root_url, notice: "Unauthorized access" unless current_user?(@user)
        redirect_to root_url unless current_user?(@user)
    end

    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end
