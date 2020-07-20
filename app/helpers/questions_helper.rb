module QuestionsHelper
  def question_header(resource)
    if resource.persisted?
      "Изменить вопрос #{resource.test.title} "
    else
      "Создать новый вопрос в тесте #{resource.test.title}"
    end
  end
end
