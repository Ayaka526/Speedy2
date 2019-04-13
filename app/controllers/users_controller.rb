class UsersController < ApplicationController
	def mypage
		 @user = User.find(params[:user_id])
	end

	def edit
		 @user = User.find(params[:id])
	    if @user.id != current_user.id
	       flash[:notice] = "ERROR!!編集する権限がありません。"
	       redirect_to user_mypage_path(current_user.id)
	      end
	end

	def update
		 @user = User.find(params[:id])
    if    @user.update(user_params)
          flash[:notice] = "User was successfully updated."
          redirect_to user_mypage_path(@user.id)
    else  render 'edit'
    end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email)
	end
end
