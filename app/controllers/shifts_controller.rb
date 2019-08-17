class ShiftsController < ApplicationController
  def index
    @organisation = Organisation.find(params[:organisation_id])
    @users = User.where(organisation_id: @organisation.id)
    # @shifts = Shifts.where(:user => [:organisation]).where('user.id = organisation.id')

    @shifts = Shift.joins(:user).where("shift.user_id = user.id")

    # Organisation id == 3
    # Get all users where orgId == 3
    # get all shifts where user id IN users

      


  end

  def create
  end

end