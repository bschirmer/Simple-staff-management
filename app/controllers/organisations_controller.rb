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
    
    redirect_to users_url
  end

  def update
    @organisation = Organisation.find(params[:id])
 
    if @organisation.update(organisation_params)
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.delete
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end
