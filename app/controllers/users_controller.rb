class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]

  def edit
	@user = User.find(params[:id])
  end

  def update
	@user = User.finf(params[:id])
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated"
		sign_in @user
		redirect_to @user
	#else
		#render 'edit'
	end
  end


  def show
    @user=User.find(params[:id])
	@microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end
end
