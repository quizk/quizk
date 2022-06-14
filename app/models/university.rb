# == Schema Information
#
# Table name: universities
#
#  id           :bigint           not null, primary key
#  code         :string(255)
#  name         :string(255)
#  discarded_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class University < ApplicationRecord
  include Discard::Model

  has_many :users
  
  validates :name, presence: true
end
