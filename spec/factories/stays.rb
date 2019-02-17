# frozen_string_literal: true

# == Schema Information
#
# Table name: stays
#
#  id         :bigint(8)        not null, primary key
#  studio_id  :bigint(8)
#  tenant_id  :bigint(8)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :stay do
    start_date { Faker::Date.between(5.days.from_now, 55.days.from_now) }
    end_date { Faker::Date.between(57.days.from_now, 75.days.from_now) }
    studio
    tenant
  end
end
