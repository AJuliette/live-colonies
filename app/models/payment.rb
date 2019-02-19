# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :stay

  # In order to get the price with a discount percentage applied on certain days of the month, I first use a method (l 31) to get the number of days in the month concerned by the discount. To do that, I check if the YearMonth of the days with a discount is the same as the YearMonth of the month we're investigating.
  # In the method price (l 12) I calculate the price of a day with a discount and multiply it with the number of days concerned by the discount. The final price is the normal price minus this discount.
  # I don't get the right price so I think I don't have the right calculus for the discount total.

  def price_of_month
    { :"#{Date::MONTHNAMES[Date.strptime(yearmonth, '%Y%m').mon]}" => price(yearmonth) }
  end

  def price(month)
    if stay.tenant.current_discount
      ((stay.studio.monthly_price * days_spent(month)) / Time.days_in_month(month[4..5].to_i, month[0..3].to_i)) - ((stay.studio.monthly_price * (stay.tenant.current_discount.discount_percentage / 100.0)) / Time.days_in_month(month[4..5].to_i, month[0..3].to_i)) * number_of_days_of_discount(month)
    else
      ((stay.studio.monthly_price * days_spent(month)) / Time.days_in_month(month[4..5].to_i, month[0..3].to_i))
    end
  end

  def days_spent(month)
    if month == stay.start_date.strftime('%Y%m') && month == stay.end_date.strftime('%Y%m')
      stay.end_date.day - stay.start_date.day
    elsif month == stay.start_date.strftime('%Y%m')
      Time.days_in_month(month[4..5].to_i, month[0..3].to_i) - stay.start_date.day
    elsif month == stay.end_date.strftime('%Y%m')
      stay.end_date.day
    else
      Time.days_in_month(month[4..5].to_i, month[0..3].to_i)
    end
  end

  def number_of_days_of_discount(month)
    discount_period = stay.tenant.current_discount.start_date.to_datetime..stay.tenant.current_discount.end_date.to_datetime
    months_discount = discount_period.map{ |m| m.strftime('%Y%m') }
    total = 0
    months_discount.each do |m|
      if m == month
        total += 1
      end
    end
    total.to_f
  end
end
