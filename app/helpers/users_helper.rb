module SessionsHelper

def current_user?(user)
user = current_user
end

def signed_in_user
	unless signed_in?
		store_location
		reditect_to_signin_path, notice: "Please sign in."
	end
end
end
