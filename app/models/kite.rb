# frozen_string_literal: true

# Missing top-level documentation comment for `class kite`
class Kite < ApplicationRecord
  belongs_to :user

  validates :owner_name, presence: true
  validates :nubmer_of_kites, presence: true
end
