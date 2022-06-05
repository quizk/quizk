class CreateQuestionSets < ActiveRecord::Migration[7.0]
  def change
    create_table :question_sets do |t|
      t.references :exam, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
