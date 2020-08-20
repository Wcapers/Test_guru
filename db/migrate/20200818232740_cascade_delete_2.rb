class CascadeDelete2 < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key "answers", "questions"
    remove_foreign_key "questions", "tests"
    remove_foreign_key "gists", "questions"
    remove_foreign_key "gists", "users"

    add_foreign_key "answers", "questions", on_delete: :cascade
    add_foreign_key "questions", "tests", on_delete: :cascade
    add_foreign_key "gists", "questions", on_delete: :cascade
    add_foreign_key "gists", "users", on_delete: :cascade

  end

  def down
  end
end
