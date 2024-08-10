require 'rails_helper'

RSpec.describe Expert, :type => :model do
  fixtures :price_histories, :bottles

  subject {price_histories(:one)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
    expect(subject.bottle).to eq bottles(:one)
    expect(subject.price).to eq 17.09
  end
  
  it "is not valid without price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without recorded_at" do
    subject.recorded_at = nil
    expect(subject).to_not be_valid
  end
end