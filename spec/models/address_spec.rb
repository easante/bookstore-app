require 'spec_helper'

describe Address do
  it 'requires address line 1' do
    address = Fabricate.build(:address, address_line1: nil)

    expect(address).not_to be_valid
    expect(address.errors[:address_line1].any?).to be_true
  end

  it 'requires a city' do
    address = Fabricate.build(:address, city: nil)

    expect(address).not_to be_valid
    expect(address.errors[:city].any?).to be_true
  end

  it 'requires a zipcode' do
    address = Fabricate.build(:address, zipcode: nil)

    expect(address).not_to be_valid
    expect(address.errors[:zipcode].any?).to be_true
  end

  it { should belong_to(:user) }
end
