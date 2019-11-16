class CreateStudy < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.string "programming_language"
      t.string "topic"
      t.string "source"
      t.string "mood"
      t.integer "time_spent"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
