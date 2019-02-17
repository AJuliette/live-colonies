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

FactoryBot.define do
  factory :studio do
    name { Faker::Space.planet }
    monthly_price { Faker::Number.decimal(2) }
  end
end
