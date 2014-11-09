require 'spec_helper'

describe User do
  it "requires a first_name" do
    john = User.new(email: 'john@example.com', password: 'password', first_name: "", last_name: 'Doe')

    expect(john).not_to be_valid
    expect(john.errors[:first_name].any?).to be_true
  end

  it "requires a last_name" do
    john = User.new(email: 'john@example.com', password: 'password', first_name: "John", last_name: '')

    expect(john).not_to be_valid
    expect(john.errors[:last_name].any?).to be_true
  end
  it "requires a email" do
    john = User.new(email: '', password: 'password', first_name: "John", last_name: 'Doe')

    expect(john).not_to be_valid
    expect(john.errors[:email].any?).to be_true
  end

  it "requires a password" do
    john = User.new(email: 'john@example.com', password: '', first_name: "John", last_name: 'Doe')

    expect(john).not_to be_valid
    expect(john.errors[:password].any?).to be_true
  end

  it "requires a #full_name" do
    john = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')

    expect(john.full_name).to eq('John Doe')
  end

  it { should have_many(:addresses) }
  it { should accept_nested_attributes_for(:addresses) }
end
