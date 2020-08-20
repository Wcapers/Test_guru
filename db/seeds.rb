# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Insert in users
timur = User.create(name: 'Timur', login: 'tim_miraz', email: 'tim_miraz@mail.ru',
   password: 123456, type: "Admin", first_name: 'Timur', last_name: 'Miraz') 

#Insert in categories
biology = Category.create(title: 'Биология')
math = Category.create(title: 'Математика')
comp_since = Category.create(title: 'Информатика')

#Insert in tests
first_test = Test.create(title: 'Умножение', level: 3, category_id: math.id, author_id: timur.id)
second_test = Test.create(title: 'Грибы', level: 2, category_id: biology.id, author_id: timur.id)
third_test = Test.create(title: 'Биты и байты', level: 4, category_id: comp_since.id, author_id: timur.id)
fourth_test = Test.create(title: 'Деление', level: 4, category_id: math.id, author_id: timur.id)
fifth_test = Test.create(title: 'Паразиты', level: 1, category_id: biology.id, author_id: timur.id)


#Insert in questions
first_question = Question.create(body: '2*5=?', test_id: first_test.id)
second_question = Question.create(body: '15*3=?', test_id: first_test.id)
third_question = Question.create(body: 'Мухомор ядовитый?', test_id: second_test.id)
fourth_question = Question.create(body: '20/10=?', test_id: fourth_test.id)
fifth_question = Question.create(body: 'Бит больше чем байт?', test_id: third_test.id)

#Insert in answers
first_question_answers = Answer.create([{ body: '10', correct: true, question_id: first_question.id }, { body: '11', question_id: first_question.id }, { body: '13', question_id: first_question.id }, { body: '9', question_id: first_question.id  }])

second_question_answers = Answer.create([{ body: '45', correct: true, question_id: second_question.id }, { body: '50', question_id: second_question.id }, { body: '52', question_id: second_question.id }, { body: '123', question_id: second_question.id }])

third_question_answers = Answer.create([{ body: 'да', correct: true, question_id: second_question.id }, { body: 'нет', question_id: second_question.id }])

fourth_question_answers = Answer.create([{ body: '2', correct: true, question_id: fourth_question.id }, { body: '5',  question_id: fourth_question.id }, { body: '10',  question_id: fourth_question.id }, { body: '12',  question_id: fourth_question.id }])

fifth_question_answers = Answer.create([{ body: 'нет', correct: true, question_id: fifth_question.id }, { body: 'да', question_id: fifth_question.id }])
