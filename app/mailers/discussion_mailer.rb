class DiscussionMailer < ApplicationMailer
  def notify_discussion_owner (comment, my_user)
    @comment = comment
    @discussion = @comment.discussion
    @my_user = my_user
    mail to: @discussion.user.email, subject: "You've got a comment!"    
  end  
end