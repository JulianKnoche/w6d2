class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    render json: User.all
  end

  def create
    # debugger
    user = User.new(user_params)#params.require(:user).permit(:name, :email)) #why doesnt error show without permits, we get forbiddenAttr..
    #user.admin = ~
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    # user = User.find(params[:id])
    render json: user
  end

  def update
    # user = User.find(params[:id])
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
    user.destroy

    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def user
    User.find(params[:id])
  end

end