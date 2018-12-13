class UsersController < ApplicationController
	def index
		authorize current_user
		@users = policy_scope(User)
	end

	def add_photo
		current_user.photo = params[:photo_id]
	end

	def show
		authorize current_user
		@user = policy_scope(User).find(params[:id])
		@pets = Pet.all.select { |pet| pet.user_id == @user.id }
	end

	def edit
	end

	def update
		@user = current_user
		authorize @user
	    if @user.update(user_params)
	      redirect_to @user
	    else
	      render :edit
	    end
	end

	def destroy
	end

	private

    def user_params
      params.require(:user).permit(:name, :photo, :address)
    end
end
