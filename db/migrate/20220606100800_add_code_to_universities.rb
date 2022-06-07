class AddCodeToUniversities < ActiveRecord::Migration[7.0]
  def change
    add_column :universities, :code, :string, after: :id
  end
end
