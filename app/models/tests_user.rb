class TestsUser < ApplicationRecord
  belongs_to :test, required: false
  belongs_to :user, required: false
end
