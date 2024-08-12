require 'rails_helper'

RSpec.describe 'tasting_notes/edit', type: :view do
  let(:tasting_note) do
    TastingNote.create!(
      score: 1.5,
      details: 'MyText',
      bottle: nil,
      expert: nil
    )
  end

  before(:each) do
    assign(:tasting_note, tasting_note)
  end

  xit 'renders the edit tasting_note form' do
    render

    assert_select 'form[action=?][method=?]', tasting_note_path(tasting_note), 'post' do
      assert_select 'input[name=?]', 'tasting_note[score]'

      assert_select 'textarea[name=?]', 'tasting_note[details]'

      assert_select 'input[name=?]', 'tasting_note[bottle_id]'

      assert_select 'input[name=?]', 'tasting_note[expert_id]'
    end
  end
end
