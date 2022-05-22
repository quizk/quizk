# == Schema Information
#
# Table name: operators
#
#  id                 :bigint           not null, primary key
#  username           :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  first_name         :string(255)      default(""), not null
#  last_name          :string(255)      default(""), not null
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

  validates :username, :first_name, :last_name, presence: true
  validates :password_confirmation, presence: true, if: :password

  def full_name
    "#{first_name} #{last_name}"
  end
end
