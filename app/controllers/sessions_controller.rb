class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if (user && user.authenticate(params[:session][:password]))
			# Successful signin
			sign_in user
			redirect_to user
			flash.now[:success] = "Success"
		else
			# Failed to signin
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end
	def destroy
		sign_out
		redirect_to root_url
	end
end