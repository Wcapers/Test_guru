class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    
  end

  def new
    @question = @test.questions.new
  end

  def create
     @question = @test.questions.new(question_params)
     if @question.save
      redirect_to test_questions_url(@test)
    else
      redirect_to new_test_question_path
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render 'edit'
   end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
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