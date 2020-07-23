class User < ApplicationRecord
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def get_tests (level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
