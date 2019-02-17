# frozen_string_literal: true

20.times do |_i|
  tenant_i = Tenant.create(email: Faker::Internet.email)
  studio_i = Studio.create(name: Faker::Space.planet, monthly_price: Faker::Number.decimal(2))
  Stay.create(start_date: Faker::Date.between(5.days.from_now, 55.days.from_now), end_date: Faker::Date.between(57.days.from_now, 365.days.from_now), studio: studio_i, tenant: tenant_i)
end
