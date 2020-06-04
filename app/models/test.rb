class Test < ApplicationRecord
   belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.get_titles(category_name)
     Test.joins('join categories on categories.id = tests.categories_id')
     .where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
   end
end
