require 'rails_helper'

RSpec.describe 'saved_searches/index', type: :view do
  before(:each) do
    assign(:saved_searches, [
             SavedSearch.create!(
               user: nil,
               search_params: ''
             ),
             SavedSearch.create!(
               user: nil,
               search_params: ''
             )
           ])
  end

  xit 'renders a list of saved_searches' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
  end
end
