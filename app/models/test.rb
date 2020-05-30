class Test < ApplicationRecord
  def self.get_titles(category_name)
     Test.joins('join categories on categories.id = tests.categories_id')
     .where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
   end
end
