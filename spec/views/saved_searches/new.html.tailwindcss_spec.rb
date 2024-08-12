require 'rails_helper'

RSpec.describe 'saved_searches/new', type: :view do
  before(:each) do
    assign(:saved_search, SavedSearch.new(
                            user: nil,
                            search_params: ''
                          ))
  end

  xit 'renders new saved_search form' do
    render

    assert_select 'form[action=?][method=?]', saved_searches_path, 'post' do
      assert_select 'input[name=?]', 'saved_search[user_id]'

      assert_select 'input[name=?]', 'saved_search[search_params]'
    end
  end
end
