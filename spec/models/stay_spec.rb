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
  describe 'Model instantiation' do
    subject(:new_stay) { described_class.new }

    describe 'Database of Item' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:studio_id).of_type(:integer) }
      it { is_expected.to have_db_column(:tenant_id).of_type(:integer) }
      it { is_expected.to have_db_column(:start_date).of_type(:datetime) }
      it { is_expected.to have_db_column(:end_date).of_type(:datetime) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  describe "Relations" do
    it 'belongs to a tenant' do
      tenant = create(:tenant)
      stay = create(:stay, tenant: tenant)
      expect(stay.tenant).to eq(tenant)
    end

    it 'belongs to a studio' do
      studio = create(:studio)
      stay = build(:stay, studio: studio)
      expect(stay.studio).to eq(studio)
    end
  end
end
