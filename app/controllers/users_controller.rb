class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
	@microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end
end
