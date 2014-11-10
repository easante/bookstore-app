require 'spec_helper'

describe OrderItem do
  it { should belong_to(:book) }
  it { should belong_to(:order) }
end
