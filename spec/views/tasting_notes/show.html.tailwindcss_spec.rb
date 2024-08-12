require 'rails_helper'

RSpec.describe 'tasting_notes/show', type: :view do
  before(:each) do
    assign(:tasting_note, TastingNote.create!(
                            score: 2.5,
                            details: 'MyText',
                            bottle: nil,
                            expert: nil
                          ))
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
