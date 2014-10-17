require 'spec_helper'

describe Book do
  it { should belong_to(:publisher) }
  it { should have_many(:publications) }
  it { should have_many(:authors).through(:publications) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:published_at) }
  it { should validate_presence_of(:publisher_id) }
  it { should validate_numericality_of(:page_count).only_integer }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0) }
end
