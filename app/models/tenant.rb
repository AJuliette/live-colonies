# frozen_string_literal: true

# == Schema Information
#
# Table name: tenants
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tenant < ApplicationRecord
  has_many :stays, dependent: :destroy
end
