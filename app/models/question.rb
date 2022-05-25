# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
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

  has_one_attached :image
end
