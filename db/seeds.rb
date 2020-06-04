# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Insert in categories
biology = Category.create(title: 'Биология')
math = Category.create(title: 'Математика')
comp_since = Category.create(title: 'Информатика')

#Insert in tests
first_test = Test.create(title: 'Умножение', level: 3, categories_id: math.id)
second_test = Test.create(title: 'Грибы', level: 2, categories_id: biology.id)
third_test = Test.create(title: 'Биты и байты', level: 4, categories_id: comp_since.id)
fourth_test = Test.create(title: 'Деление', level: 4, categories_id: math.id)
fifth_test = Test.create(title: 'Паразиты', level: 1, categories_id: biology.id)

#Insert in users
timur = User.create(name: 'Timur', login: 'tim_miraz', email: 'tim_miraz@mail.ru', password: 12345)
ivan = User.create(name: 'Ivan', login: 'ivan_ivan', email: 'ivan_ivana@mail.ru', password: 54321)

#Insert in questions
first_question = Question.create(body: '2*5=?', tests_id: first_test.id)
second_question = Question.create(body: '15*3=?', tests_id: first_test.id)
third_question = Question.create(body: 'Мухомор ядовитый?', tests_id: second_test.id)
fourth_question = Question.create(body: '20/10=?', tests_id: fourth_test.id)
fifth_question = Question.create(body: 'Бит больше чем байт?', tests_id: third_test.id)

#Insert in answers
first_question_answers = Answer.create([{ body: '10', correct: true, questions_id: first_question.id }, { body: '11', questions_id: first_question.id }, { body: '13', questions_id: first_question.id }, { body: '9', questions_id: first_question.id  }])

second_question_answers = Answer.create([{ body: '45', correct: true, questions_id: second_question.id }, { body: '50', questions_id: second_question.id }, { body: '52', questions_id: second_question.id }, { body: '123', questions_id: second_question.id }])

third_question_answers = Answer.create([{ body: 'да', correct: true, questions_id: second_question.id }, { body: 'нет', questions_id: second_question.id }])

fourth_question_answers = Answer.create([{ body: '2', correct: true, questions_id: fourth_question.id }, { body: '5',  questions_id: fourth_question.id }, { body: '10',  questions_id: fourth_question.id }, { body: '12',  questions_id: fourth_question.id }])

fifth_question_answers = Answer.create([{ body: 'нет', correct: true, questions_id: fifth_question.id }, { body: 'да', questions_id: fifth_question.id }])
