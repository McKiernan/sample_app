module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		# Using cookies with an expiration date
		# cookies[:remember_token] = { value: remember_tokeb,
	   	# expires: 20.years.from_now.utc }
		
		user.update_attribute(:remember_token, User.digest(remember_token))
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def current_user?(user)
		puts "CHECKING CURRENT USER"
		puts user.name
		if(@current_user.nil?)
			puts "Current user is nil"
		end
		if (user == @current_user) 
			puts "yes"
		else
			puts "no"
		end

		user == current_user
	end	

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		current_user.update_attribute(:remember_token, 
			User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
	
	def store_location
		session[:return_to] = request.url if request.get?
	end

	def signed_in_user
        # redirect_to signin_url, notice: "Please sign in." unless signed_in?
        # This is equivalent to
        unless signed_in?
            puts "Not signed in"
            store_location
            flash[:notice] = "Please sign in."
            redirect_to signin_url
        else 
        	puts "User is signed in"
        end
    end
end
