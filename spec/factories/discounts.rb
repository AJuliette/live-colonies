# frozen_string_literal: true

FactoryBot.define do
  factory :discount do
    tenant { nil }
    discount_percentage { 1 }
    start_date { "" }
    end_date { "" }
  end
end
