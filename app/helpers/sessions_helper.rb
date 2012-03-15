module SessionsHelper

    def sign_in(user)
		current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
	end
end