class User < ApplicationRecord
  def get_tests (level)
    Test.joins('join results on tests.id = results.test_id').where(
      'results.user_id = ? and tests.level = ?', self.id, level)
  end
end
