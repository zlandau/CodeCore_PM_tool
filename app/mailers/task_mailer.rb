class TaskMailer < ApplicationMailer
  def notify_task_owner (task, my_user)
    @task = task
    @my_user = my_user
    mail to: @task.user.email, subject: "You have a completed task!"   
  end
end
