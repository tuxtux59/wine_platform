require 'rails_helper'

RSpec.describe 'saved_searches/show', type: :view do
  before(:each) do
    assign(:saved_search, SavedSearch.create!(
                            user: nil,
                            search_params: ''
                          ))
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
