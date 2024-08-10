require 'rails_helper'

RSpec.describe Expert, type: :model do
  fixtures :tasting_notes, :bottles, :experts

  subject { tasting_notes(:one) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without bottle' do
    subject.bottle = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without expert' do
    subject.expert = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without score' do
    subject.score = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with zero score' do
    subject.score = 0
    expect(subject).to_not be_valid
  end

  it 'is not valid with score greater than 5' do
    subject.score = 5.01
    expect(subject).to_not be_valid
  end

  it 'is valid with score of 5' do
    subject.score = 5
    expect(subject).to be_valid
  end
end
