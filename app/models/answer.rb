# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  question_id :bigint           not null
#  status      :integer          default("wrong"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question
  has_rich_text :content

  validates :content, presence: true

  module Status
    ALL = %i[wrong right].freeze

    WRONG = 'wrong'.freeze
    RIGHT = 'right'.freeze
  end

  enum status: Status::ALL
end
