class FeedbackMailer < ApplicationMailer
  def feedback(user, message)
    @user = user
    @message = message
    mail to: Admin.first.email
  end
end
