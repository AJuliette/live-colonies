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

FactoryBot.define do
  factory :tenant do
    email { Faker::Internet.email }
  end
end
