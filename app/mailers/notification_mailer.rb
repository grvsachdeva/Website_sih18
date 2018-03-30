class NotificationMailer < ApplicationMailer
  default from: "sachdevarockz@gmail.com"

  def send_notification(employee,message)
    @employee = employee
    @message = message
    mail(to: @employee.email, subject: "Please send your current position update #{ @employee.name }" )
  end
end
