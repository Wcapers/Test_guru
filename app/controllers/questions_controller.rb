class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    render inline: "<h1><%=@question.body%><\h1>"
  end

  def new
    @question = @test.questions.new
  end

  def create
     @question = @test.questions.new(question_params)
     if @question.save
      redirect_to test_questions_url(@test)
    else
      render inline: '<h1> ❗<%= @question.errors.full_messages %>❗</h1>'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find params[:test_id]
  end

  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render inline: "<h1>Ошибка!<br>Вопрос не найден. <\h1>"
  end
end
