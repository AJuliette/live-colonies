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

require 'rails_helper'

RSpec.describe Tenant, type: :model do
  describe 'Model instantiation' do
    subject(:new_tenant) { described_class.new }

    describe 'Database of Item' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:email).of_type(:string) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  describe "Relations" do
    it { is_expected.to have_many(:stays) }
  end
end
