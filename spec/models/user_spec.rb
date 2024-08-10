require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  subject { users(:one) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid with second valid attributes' do
    expect(users(:two)).to be_valid
  end

  it 'is is not valid without username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is is not valid with short username' do
    subject.username = 'jane'
    expect(subject).to_not be_valid
  end

  it 'is is not valid without email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is is not valid without proper email' do
    subject.email = 'nil'
    expect(subject).to_not be_valid
  end
end
