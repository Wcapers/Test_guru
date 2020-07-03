class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show]

  def index
    @questions = @test.questions
  end

  def show
    render inline: "<h1><%=@question.body%><\h1>"
  end

  private

  def find_test
    @test = Test.find params[:test_id]
  end

  def find_question
    @question = Question.find params[:id]
  end
end
