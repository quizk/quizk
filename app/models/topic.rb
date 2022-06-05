# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Topic < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :question_sets, dependent: :destroy

  validates :name, presence: true
end
