# == Schema Information
#
# Table name: universities
#
#  id           :bigint           not null, primary key
#  name         :string(255)
#  discarded_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class University < ApplicationRecord
  include Discard::Model

  validates :name, presence: true
end
