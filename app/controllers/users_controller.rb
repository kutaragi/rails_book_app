class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@post_book = Book.new
  	@books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(current_user.id)
  	end
  end

  def update
  	@user = User.find(params[:id])

	if @user.update(user_params)
	  	flash[:notice] = "You have updated user successfully."
	  	redirect_to user_path(@user.id)
	else
		flash[:notice] = "error"
		render :edit
	end
  end

  def index
  	@user = User.find(current_user.id)
  	@post_book = Book.new
  	@users = User.all
  end

  def top
  	
  end

  def about
  	
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
