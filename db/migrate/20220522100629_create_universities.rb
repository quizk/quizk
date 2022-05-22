class CreateUniversities < ActiveRecord::Migration[7.0]
  def change
    create_table :universities do |t|
      t.string :name

      t.datetime :discarded_at
      t.timestamps
    end
  end
end
