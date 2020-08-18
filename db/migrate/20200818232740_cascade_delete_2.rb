class CascadeDelete2 < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key "answers", "questions"
    remove_foreign_key "questions", "tests"

    add_foreign_key "answers", "questions", on_delete: :cascade
    add_foreign_key "questions", "tests", on_delete: :cascade
  end
end
