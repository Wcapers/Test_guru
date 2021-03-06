class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  MIN_TRESHOLD = 85

  def completed?
    current_question.nil?
  end

  def accept (answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def success?
   result >= MIN_TRESHOLD
  end

  def questions_count
    self.test.questions.count
  end

  def result
    (self.correct_questions / questions_count) * 100
  end

  def progress_bar
    ((current_question_number - 1) * 100) / questions_count
  end

  def current_question_number
    test.questions.to_a.index(current_question) + 1
  end

  private


  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    correct_answers_count == correct_answers.where(id: answer_ids).count &&
     correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id>?',
       current_question.id).first
  end
end
