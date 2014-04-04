class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if (user && user.authenticate(params[:session][:password]))
			# Successful signin
			flash[:success] = "Success"
			render 'new'
		else
			# Failed to signin
			flash[:error] = "Invalid email/password combination"
			render 'new'
		end
	end
	def destroy
	end
end
