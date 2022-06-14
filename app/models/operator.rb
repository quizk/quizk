# == Schema Information
#
# Table name: operators
#
#  id                 :bigint           not null, primary key
#  email              :string(255)      default(""), not null
#  username           :string(255)      default("")
#  encrypted_password :string(255)      default(""), not null
#  discarded_at       :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_operators_on_discarded_at  (discarded_at)
#  index_operators_on_username      (username) UNIQUE
#
class Operator < ApplicationRecord
  include Discard::Model

  devise :database_authenticatable

  validates :username, presence: true
  validates :password_confirmation, presence: true, if: :password
end
