class FeedbackController < ApplicationController
  def new
  end

  def create
    user = current_user.email
    FeedbackMailer.feedback(user, feedback_text).deliver_now
    flash[:notice] = "Ваш отзыв отправлен"
    redirect_to root_path
  end

  private

  def feedback_text
    params.require(:body)
  end
end
