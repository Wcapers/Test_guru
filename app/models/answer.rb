class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_answers

  private

  def validate_answers
    errors.add(:question) if self.question.answers.count > 4
  end
end
