class FeedbackController < ApplicationController
  def new
  end

  def create
    user = current_user.email
    FeedbackMailer.feedback(user, feedback_text).deliver_now
    redirect_to root_path
  end

  private

  def feedback_text
    params.require(:body)
  end
end
