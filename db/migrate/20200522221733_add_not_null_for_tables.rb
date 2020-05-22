class AddNotNullForTables < ActiveRecord::Migration[6.0]
  def change

    #for tests
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :categories_id, false)

    #for questions
    change_column_null(:questions, :body, false)

    #for answers
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :questions_id, false)

    #for users
    change_column_null(:users, :name, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)

    #for categories
    change_column_null(:categories, :title, false)
  end
end
