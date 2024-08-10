require 'rails_helper'

RSpec.describe SavedSearch, :type => :model do
  fixtures :saved_searches, :users

  subject {saved_searches(:one)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
    expect(subject.user).to eq users(:one)
  end
 
  it "is valid with valid second attributes" do
    saved_search = saved_searches(:two)
    expect(saved_search).to be_valid
    expect(saved_search.user).to eq users(:two)
  end

  it "is is not valid without user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is is not valid without search_params" do
    subject.search_params = nil
    expect(subject).to_not be_valid
  end
end