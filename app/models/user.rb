# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  university_id          :bigint
#  email                  :string(255)      default(""), not null
#  username               :string(255)      default("")
#  encrypted_password     :string(255)      default(""), not null
#  code                   :string(255)      default("")
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_university_id         (university_id)
#
# Foreign Keys
#
#  fk_rails_...  (university_id => universities.id)
#
class User < ApplicationRecord
  include Discard::Model

  devise :database_authenticatable, :registerable, :recoverable, :validatable

  belongs_to :university

  validates :email, :username, presence: true
end
