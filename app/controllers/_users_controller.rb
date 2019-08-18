class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    # Set organistationId to 0 to know its not assigned
    @user.organisation_id = 0
    @passwordConfirm = params[:passwordConfirm]

    #password match validation

    if @user.save   
      session[:user_id] = @user.id   
      redirect_to root_url, notice: 'User successfully created.'   
    else   
      render :new   
    end   

  end
   
  def show
    @user = User.find(params[:id])

    if @user.organisation_id==0
      @organisations = Organisation.all
      render template: "users/noOrganisation" 
    else
      @organisation = Organisation.find(@user.organisation_id)
    end

  end

  

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
