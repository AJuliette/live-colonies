# frozen_string_literal: true

20.times do |_i|
  tenant_i = Tenant.create(email: Faker::Internet.email)
  studio_i = Studio.create(name: Faker::Space.planet, monthly_price: Faker::Number.decimal(2))
  Stay.create!(start_date: "2019-04-12 00:00:00", end_date: "2019-10-12 00:00:00", studio: studio_i, tenant: tenant_i)
  Stay.create!(start_date: "2019-10-13 00:00:00", end_date: "2019-12-25 00:00:00", studio: studio_i, tenant: tenant_i)
end
