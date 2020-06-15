class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  validates :email, presence: true
  def get_tests (level)
    self.tests.where(level: level)
  end
end
