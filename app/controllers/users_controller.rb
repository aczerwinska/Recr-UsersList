class UsersController < ApplicationController

	http_basic_authenticate_with name: "aga", password: "secret", except: [:index, :show]

	def index
		
    	@search = User.search(params[:q])
    	@users = @search.result
  	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
  		@user = User.new(user_params)
 
  		if @user.save
  			redirect_to users_path
  		else
  			render 'new'
  		end
	end

	def update
  		@user = User.find(params[:id])
 
  		if @user.update(user_params)
    		redirect_to users_path
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@user = User.find(params[:id])
  		@user.destroy
 
  		redirect_to users_path
	end
 
	private
  		def user_params
    		params.require(:user).permit(:firstname, :surname, :email, :password)
  		end

	def delete
	end
end
