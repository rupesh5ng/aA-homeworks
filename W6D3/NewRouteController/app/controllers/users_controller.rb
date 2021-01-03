class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_columns)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show

        render json: User.find( params[:id])

    end

    def update
        user = User.find(params[:id])
        if user.update(user_columns)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages , status: 422
        end
    end

    def destroy
        user_new =  User.delete(params[:id])
        render json: user_new
    end

    private
    def user_columns
        params.require(:user).permit(:name, :email)
    end

end
