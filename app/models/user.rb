# frozen_string_literal: true

# Missing top-level documentation comment for `class User`
class User < ApplicationRecord
  has_many :kites

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: 'must be 10 digits' }
  validates :address, presence: true
end
