require 'rails_helper'

RSpec.describe 'tasting_notes/index', type: :view do
  before(:each) do
    assign(:tasting_notes, [
             TastingNote.create!(
               score: 2.5,
               details: 'MyText',
               bottle: nil,
               expert: nil
             ),
             TastingNote.create!(
               score: 2.5,
               details: 'MyText',
               bottle: nil,
               expert: nil
             )
           ])
  end

  xit 'renders a list of tasting_notes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
