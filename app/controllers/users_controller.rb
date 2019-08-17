class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    # Set organistationId to 0 to know its not assigned
    @user.organisation_id = 0
    @passwordConfirm = params[:passwordConfirm]

    #password match validation

    @user.save
    redirect_to @user
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

  def joinOrganisation
    @user = User.find(params[:user_id])
    @organisation = Organisation.find(params[:organisation_id])
    # Update user with organisation id
    @user.organisation_id = @organisation.id
    @user.save
    redirect_to @user
  end

  def leaveOrganisation
    @user = User.find(params[:userId])
    # Remove organisation id
    @user.organisation_id = 0
    @user.save
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
