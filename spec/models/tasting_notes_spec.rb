require 'rails_helper'

RSpec.describe Expert, :type => :model do
  fixtures :tasting_notes, :bottles, :experts

  subject {tasting_notes(:one)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without bottle" do
    subject.bottle = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without expert" do
    subject.expert = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without score" do
    subject.score = nil
    expect(subject).to_not be_valid
  end
end