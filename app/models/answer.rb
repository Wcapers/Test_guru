class Answer < ApplicationRecord
  validates :body, presence: true
  belongs_to :question
  scope :corrects, -> { where(correct: true) }
  validate :validate_answers
  private
  def validate_answers
    errors.add(:question) if self.question.answers.count > 4
  end
end
