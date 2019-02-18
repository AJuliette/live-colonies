# frozen_string_literal: true

# == Schema Information
#
# Table name: studios
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  monthly_price :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Studio < ApplicationRecord
  has_many :stays, dependent: :destroy
  has_many :payments, through: :stays
end
