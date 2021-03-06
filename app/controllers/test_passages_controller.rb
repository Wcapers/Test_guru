class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept(params[:answer_ids])
    if @test_passage.completed?
      RewardUserService.new(@test_passage).call if @test_passage.success?
    #  TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    connect = GistQuestionService.new(@test_passage.current_question)
    result = connect.call
    if connect.success?
      current_user.gists.create(question_id: @test_passage.current_question_id, url: result.html_url)
      flash[:notice] =  t('.success', gist_link: view_context.link_to('Gist', result.html_url, :target => '_blank'))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
