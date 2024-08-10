require 'rails_helper'

RSpec.describe Bottle, type: :model do
  fixtures :bottles, :experts

  subject { bottles(:one) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
    expect(subject.name).to eq 'Chateau Ste. Michelle Merlot'
    expect(subject.thumb).to eq 'https://images.vivino.com/thumbs/XpXhtt4KQYG5aAYU4yvfuw_pb_300x300.png'
    expect(subject.sale_url).to eq 'https://www.vivino.com/US-CA/fr/wines/1988261'
    expect(subject.grape_variety).to eq 'Merlot'
    expect(subject.vintage).to eq '2019'
  end

  it 'uses default thumb if not given' do
    bottle = bottles(:two)
    expect(bottle).to be_valid
    expect(bottle.name).to eq 'Les Jamelles Malbec'
    expect(bottle.thumb).to eq 'https://mockupfree.net/wp-content/uploads/2022/08/wine-bottle-scaled.jpg'
    expect(bottle.sale_url).to eq 'https://www.vivino.com/wines/4213435'
    expect(bottle.grape_variety).to eq 'Malbec'
    expect(bottle.vintage).to eq '2018'
  end

  it 'is is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.grape_variety).to eq 'Merlot'
  end

  it 'is is not valid without grape_variety' do
    subject.grape_variety = nil
    expect(subject).to_not be_valid
  end

  it 'is is not valid without sale_url' do
    subject.sale_url = nil
    expect(subject).to_not be_valid
  end

  it 'should return proper latest_price' do
    price_histories = subject.price_histories
    expect(price_histories.length).to eq 1
    price_history = price_histories[0]
    expect(price_history.price).to eq 17.09

    new_price_history = PriceHistory.new(bottle: subject, price: 10.5, recorded_at: DateTime.now)
    new_price_history.save!
    price_histories = subject.reload.price_histories
    expect(price_histories.length).to eq 2
    expect(subject.reload.latest_price).to eq 10.5
  end

  it 'should return proper current average_score' do
    average_score = subject.average_score
    expect(average_score).to eq 3.8

    expert = experts(:two)
    TastingNote.new(bottle: subject, expert:, score: 5).save!
    expect(subject.reload.average_score).to eq 4.4
  end

  it 'is not valid if too short name' do
    subject.name = 'wrong'
    expect(subject).to_not be_valid
  end

  it 'is not valid if just below 10 char name' do
    subject.name = 'azertyuio'
    expect(subject).to_not be_valid
  end

  it 'is valid if just 10 char name' do
    subject.name = 'azertyuiop'
    expect(subject).to be_valid
  end

  it 'is not valid if too short grape_variety' do
    subject.grape_variety = 'bad'
    expect(subject).to_not be_valid
  end

  it 'is not valid if just below 10 char grape_variety' do
    subject.grape_variety = 'azer'
    expect(subject).to_not be_valid
  end

  it 'is valid if just 5 char grape_variety' do
    subject.grape_variety = 'Merlot'
    expect(subject).to be_valid
  end

  it 'is not valid if nil sale_url' do
    subject.sale_url = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if wrong sale_url' do
    subject.sale_url = 'Merlot'
    expect(subject).to_not be_valid
  end

  it 'is not valid if wrong thumb format' do
    subject.sale_url = 'Merlot'
    expect(subject).to_not be_valid
  end
end
