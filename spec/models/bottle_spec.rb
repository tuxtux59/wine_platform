require 'rails_helper'

RSpec.describe Bottle, :type => :model do
  fixtures :bottles

  subject {bottles(:one)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
    expect(subject.name).to eq "Chateau Ste. Michelle Merlot"
    expect(subject.thumb).to eq "Chateau Ste. Michelle Merlot"
    expect(subject.grape_variety).to eq "Chateau Ste. Michelle Merlot"
    expect(subject.vintage).to eq "Chateau Ste. Michelle Merlot"
  end
  
  it "uses default thumb if not given" do
    bottle = bottles(:two)
    expect(bottle).to be_valid
    expect(bottle.thumb).to eq "https://images.vivino.com/thumbs/8p9A_FO6RR-KE44gtmdkTA_pl_375x500.png"
  end

  it "is is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.grape_variety).to eq "Merlot"
  end

  it "is is not valid without grape_variety" do
    subject.grape_variety = nil
    expect(subject).to_not be_valid
  end

  it "is is not valid without sale_url" do
      subject.sale_url = nil
    expect(subject).to_not be_valid
  end
end