class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    redirect_to action: "show", id: session[:user_id]
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    if @user.organisation_id==0
      @organisations = Organisation.all
      render template: "users/noOrganisation" 
    else
      @organisation = Organisation.find(@user.organisation_id)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.organisation_id=0
      if @user.save
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render :new,  notice: 'Something went wrong, please contact your system admin'
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:organisation_id, :name, :email, :password, :password_confirmation)
    end
end
