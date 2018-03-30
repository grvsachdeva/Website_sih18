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
      @employee = current_employee
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

  def notify_employee
    @sender = current_employee
    @employees = Employee.where(isAdmin: false)
  end

  def send_notification
    byebug
    @sender = current_employee
    @employee = Employee.where(id: params[:eid]).first
    NotificationMailer.send_notification(@employee, @sender).deliver_now
    flash[:notice] = "Mail sent !!! "
    redirect_to '/notify_employee'
  end
end
