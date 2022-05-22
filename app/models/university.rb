# == Schema Information
#
# Table name: universities
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class University < ApplicationRecord
  include Discard::Model

  validates :name, presence: true
end
