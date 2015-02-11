class TaskMailer < ApplicationMailer
  def notify_task_owner (task)
    @task = task
    @user = @task.user
    mail to: @user.email, subject: "You have a completed task!"    
  end
end
