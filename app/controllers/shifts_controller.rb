class ShiftsController < ApplicationController
  def index
    @organisation = Organisation.find(params[:organisation_id])
    @users = User.where(organisation_id: @organisation.id)

    @shifts = Shift.joins(:user).where(user_id: @users.ids)

    # Build shift data
    @shiftsHash = []
    @shifts.each do |s|
      shiftsObject = ShiftObject.new
      
      # this seem dodgy but i dont know how else to do it
      shiftsObject.employee_name = @users.where(id: s.user_id).pluck(:name)[0]
      shiftsObject.shift_date = s.start.to_date()
      shiftsObject.start_time = s.start.strftime("%I:%M%p")
      shiftsObject.finish_time = s.finish.strftime("%I:%M%p")
      shiftsObject.break_length = s.break_length

      hours_worked = (((s.finish - s.start)/60 - s.break_length)/60).round(2)
      shiftsObject.hours_worked = "%.2f hours" % [hours_worked]

      shift_cost = (hours_worked * @organisation.hourly_rate).round(2)
      shiftsObject.shift_cost = "$%.2f" % [shift_cost]

      @shiftsHash.push(shiftsObject)
    end
  end

  def create
    @shift = Shift.new
    # shiftObject = ShiftObject.new
    @shift.user_id = current_user.id

    start_dateTime = DateTime.parse("%s%s" % [ params[:shift_date].to_datetime() , params[:start_time].to_datetime()   ] ).strftime("%F %T")

    @shift.start = start_dateTime

    finish_dateTime = DateTime.parse("%s%s" % [ params[:shift_date].to_datetime() , params[:finish_time].to_datetime()   ] ).strftime("%F %T")

    @shift.finish = finish_dateTime

    @shift.break_length = params[:break_length]

    @shift.save
    redirect_to action: "index", organisation_id: params[:organisation_id]
  end

   # Never trust parameters from the scary internet, only allow the white list through.
  def shift_params
    params.permit(:organisation_id, :shift_date, :start_time, :finish_time, :break_length)
  end

end