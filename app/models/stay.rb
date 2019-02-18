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

class Stay < ApplicationRecord
  belongs_to :studio
  belongs_to :tenant

  validate :no_reservation_overlap

  def no_reservation_overlap
    return if self
              .class
              .where(studio_id: studio_id)
              .where('start_date <= ? AND end_date >= ?', end_date, start_date)
              .none?

    errors.add(:stay, 'Overlapping reservation exists')
  end
end
