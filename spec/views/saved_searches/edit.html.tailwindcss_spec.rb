require 'rails_helper'

RSpec.describe 'saved_searches/edit', type: :view do
  let(:saved_search) do
    SavedSearch.create!(
      user: nil,
      search_params: ''
    )
  end

  before(:each) do
    assign(:saved_search, saved_search)
  end

  xit 'renders the edit saved_search form' do
    render

    assert_select 'form[action=?][method=?]', saved_search_path(saved_search), 'post' do
      assert_select 'input[name=?]', 'saved_search[user_id]'

      assert_select 'input[name=?]', 'saved_search[search_params]'
    end
  end
end
