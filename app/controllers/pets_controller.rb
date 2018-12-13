class PetsController < ApplicationController
	def index
		authorize current_user
		@pets = policy_scope(Pet)
	end

	def show
		authorize current_user
		@user = User.find(params[:user_id])
		@pet = Pet.find(params[:id])
	end

	def edit
	end

	def new
		authorize current_user
    	@pet = Pet.new
    	@user = User.find(params[:user_id])
	end

	def create
		authorize current_user
	    @pet = policy_scope(Pet).new(pet_params)
	    @pet.user_id = current_user.id
    	@user = current_user
	    if @pet.save
	      redirect_to current_user
	    else
	      render :new
	    end
	end

	def update
		authorize current_user
		@pet = policy_scope(Pet).find(params[:id])
		@user = current_user
		authorize @user
	    if @pet.update(pet_params)
	      redirect_to current_user
	    else
	      render :edit
	    end
	end

	def destroy
		authorize current_user
		@pet = policy_scope(Pet).find(params[:id])
		@pet.destroy
    	redirect_to current_user
	end

	private

    def pet_params
      params.require(:pet).permit(:name, :photo, :weight)
    end
end
