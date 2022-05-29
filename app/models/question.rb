# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_questions_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy

  has_rich_text :content
end
