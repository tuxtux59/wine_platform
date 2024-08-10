require 'rails_helper'

RSpec.describe Expert, :type => :model do
  fixtures :experts

  subject {experts(:one)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without username" do
    subject.username = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end