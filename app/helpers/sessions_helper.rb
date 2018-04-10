module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

    # Returns the current logged-in user (if any).
	def get_current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

  	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!get_current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
end
