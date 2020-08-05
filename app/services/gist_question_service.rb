class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
      {
        "description": I18n.t('.title', title: @test.title),
        "public": true,
        "files": {
          "test_guru#{I18n.t('.text', test: @test.title, question: @question.id)}.txt": {
            "content": gist_content
          }
        }
      }
    end

  def gist_content
      content = [@question.body]
      content += @question.answers.pluck(:body)
      content.join("\n")
    end


end
