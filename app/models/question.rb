# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  topic_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_questions_on_topic_id  (topic_id)
#
# Foreign Keys
#
#  fk_rails_...  (topic_id => topics.id)
#
class Question < ApplicationRecord
  belongs_to :topic
  has_many :answers, dependent: :destroy
  has_rich_text :content
  has_one :content, class_name: 'ActionText::RichText', as: :record

  validates :content, presence: true
end
