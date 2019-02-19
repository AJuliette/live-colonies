# frozen_string_literal: true

class Discount < ApplicationRecord
  belongs_to :tenant
  scope :active, -> { where(active: true) }
end
