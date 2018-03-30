class HomeController < ApplicationController
  before_action :authenticate_employee!

  def index

  end

  def employee_index
    if current_employee && current_employee.isAdmin == true
      flash[:notice] = "You are an Administrator, please use 'Login as Admin' option to login !!!"
      reset_session
      redirect_to '/employees/sign_in'
    else
      @employees = Employee.all
      @departments = Department.all
    end

  end

  def admin_index
    if current_employee && current_employee.isAdmin == false
      flash[:notice] = "You are a Employee, please use 'Login as Employee' option to login !!!"
      reset_session
      redirect_to '/employees/sign_in'
    else
      @employees = Employee.all
      @departments = Department.all
    end

  end

  def mark_attendance
    latitude = params[:latitude]
    longitude = params[:longitude]
    geo_localization = "#{latitude},#{longitude}"
    query = Geocoder.search(geo_localization).first
      location = query.formatted_address
    time_in = Time.now
    employee_id = current_employee.id
data = [location,time_in,employee_id]
byebug
    @attendance = Attendance.create(args[:data].to_h)
  end


end
