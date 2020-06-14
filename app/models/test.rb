class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy_tests, -> { where(level: 0..1) }
  scope :normal_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }
  def self.get_titles(category_name)
    Test.joins('join categories on categories.id = tests.categories_id').where(
      'categories.title = ?', category_name).order(title: :desc).pluck(:title)
   end
end
