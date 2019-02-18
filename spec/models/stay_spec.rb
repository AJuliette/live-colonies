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

require 'rails_helper'

RSpec.describe Stay, type: :model do
  describe "No overlapping for a stay in a same studio" do
    let(:studio) { create(:studio) }
    let(:stay) { create(:stay, studio: studio, start_date: "2019-02-04 00:00:00", end_date: "2019-12-04 00:00:00") }

    it "can't start during an existing stay" do
      stay1 = Stay.new(studio: studio, start_date: "2019-04-04 00:00:00", end_date: "2019-12-14 00:00:00" )
      expect(stay1).not_to be_valid
    end

    it "can't end during an existing stay" do
      stay1 = Stay.new(studio: studio, start_date: "2019-01-04 00:00:00", end_date: "2019-12-02 00:00:00" )
      expect(stay1).not_to be_valid
    end

    it "can't surrounder an existing stay" do
      stay1 = Stay.new(studio: studio, start_date: "2019-02-02 00:00:00", end_date: "2019-12-05 00:00:00" )
      expect(stay1).not_to be_valid
    end

    it "can't happen in an existing stay" do
      stay1 = Stay.new(studio: studio, start_date: "2019-02-06 00:00:00", end_date: "2019-11-05 00:00:00" )
      expect(stay1).not_to be_valid
    end

    it "can't start on the end day of an existing stay" do
      stay1 = Stay.new(studio: studio, start_date: "2019-12-04 00:00:00", end_date: "2019-12-25 00:00:00" )
      expect(stay1).not_to be_valid
    end

    it "can't end on the start day of an existing stay" do
      stay1 = Stay.new(studio: studio, start_date: "2019-01-04 00:00:00", end_date: "2019-02-04 00:00:00" )
      expect(stay1).not_to be_valid
    end
  end
end
