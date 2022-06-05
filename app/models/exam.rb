# == Schema Information
#
# Table name: exams
#
#  id         :bigint           not null, primary key
#  status     :integer          default(0), not null
#  time_limit :integer          default(0), not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Exam < ApplicationRecord
  has_many :question_sets, dependent: :destroy

  validates :title, :time_limit, presence: true
end
