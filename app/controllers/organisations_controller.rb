class OrganisationsController < ApplicationController
  def new
    @organisation = Organisation.new
  end

  def edit
    # get organisation from params
    @organisation = Organisation.find(params[:id])
  end

  def create
    # get organisation from params and save
    @organisation = Organisation.new(organisation_params)
    @organisation.save
    redirect_to @user
  end

  def update
    @organisation = Organisation.find(params[:id])
 
    if @organisation.update(organisation_params)
      render template: 'users/show'
    else
      render 'edit'
    end
  end

  private
  def organisation_params
    params.require(:organisation).permit(:name, :hourlyRate)
  end
end
