class Payment < ApplicationRecord
  belongs_to :stay

  def monthly_price
    { :"#{Date::MONTHNAMES[Date.strptime(yearmonth, '%Y%m').mon]}" => price(yearmonth) }
  end

  def price(month)
    price = (stay.studio.monthly_price * days_spent(month)) / Time.days_in_month(month[4..5].to_i, month[0..3].to_i)
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
end
