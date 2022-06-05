# == Schema Information
#
# Table name: question_sets
#
#  id         :bigint           not null, primary key
#  exam_id    :bigint           not null
#  topic_id   :bigint           not null
#  amount     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_question_sets_on_exam_id   (exam_id)
#  index_question_sets_on_topic_id  (topic_id)
#
# Foreign Keys
#
#  fk_rails_...  (exam_id => exams.id)
#  fk_rails_...  (topic_id => topics.id)
#
class QuestionSet < ApplicationRecord
  belongs_to :exam
  belongs_to :topic

  validates :amount, presence: true
end
