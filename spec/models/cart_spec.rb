require 'spec_helper'

describe Cart do
  it { should have_many(:cart_items) }
  it { should have_many(:books).through(:cart_items) }
end
