require 'rails_helper'

RSpec.describe 'tasting_notes/new', type: :view do
  before(:each) do
    assign(:tasting_note, TastingNote.new(
                            score: 1.5,
                            details: 'MyText',
                            bottle: nil,
                            expert: nil
                          ))
  end

  xit 'renders new tasting_note form' do
    render

    assert_select 'form[action=?][method=?]', tasting_notes_path, 'post' do
      assert_select 'input[name=?]', 'tasting_note[score]'

      assert_select 'textarea[name=?]', 'tasting_note[details]'

      assert_select 'input[name=?]', 'tasting_note[bottle_id]'

      assert_select 'input[name=?]', 'tasting_note[expert_id]'
    end
  end
end
