# == Schema Information
#
# Table name: exams
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  status     :integer          default("inactive"), not null
#  time_limit :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Exam < ApplicationRecord
  has_many :question_sets, dependent: :destroy

  validates :title, :time_limit, presence: true

  module Status
    ALL = %i[inactive active].freeze

    INACTIVE = 'inactive'.freeze
    ACTIVE = 'active'.freeze
  end

  enum status: Status::ALL
end
