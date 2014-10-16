require 'spec_helper'

describe Publication do
  it { should belong_to(:author) }
  it { should belong_to(:book) }
end
