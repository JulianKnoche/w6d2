class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    if params[:username]
      render json: User.where("username ILIKE \'#{params[:username]}%\'")
    else
      render json: User.all
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    # debugger
    # user_params = params.require(:user).permit(:name, :email)
    if 
      user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy

    user = User.find(params[:id])

    user.destroy

    render json: user
  end

  # protected

  # def user
  #   User.find(params[:id])
  # end

  private

  def user_params
    params.require(:user).permit(:username)
  end
  

end