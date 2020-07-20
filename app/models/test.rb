class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :level, uniqueness: { scope: :title, message: "Может существовать только один Тест с данным названием и уровнем" }

  scope :easy_tests, -> { where(level: 0..1) }
  scope :normal_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }
  scope :categories_by_name, -> (name) { joins(:category).where(categories: {title: name}) }
  def self.get_titles(name)
    categories_by_name(name).order(title: :desc).pluck(:title)
  end
end
