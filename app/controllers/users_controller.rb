class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    # Set organistationId to 0 to know its not assigned
    @user.organisationId = 0
    @passwordConfirm = params[:passwordConfirm]

    #password match validation

    @user.save
    redirect_to @user
  end
   
  def show
    @user = User.find(params[:id])

    if @user.organisationId==0
      @organisations = Organisation.all
      render template: "users/noOrganisation" 
    else
      @organisation = Organisation.find(@user.organisationId)
    end

  end

  def joinOrganisation
    @user = User.find(params[:userId])
    @organisation = Organisation.find(params[:organisationId])
    # Update user with organisation id
    @user.organisationId = @organisation.id
    @user.save
    redirect_to @user
  end

  def leaveOrganisation
    @user = User.find(params[:userId])
    # Remove organisation id
    @user.organisationId = 0
    @user.save
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
