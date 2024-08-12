require 'rails_helper'

RSpec.describe 'bottles/index', type: :view do
  before(:each) do
    assign(:bottles, [
             Bottle.create!(
               name: 'Name',
               grape_variety: 'Grape Variety',
               vintage: 'Vintage',
               sale_url: 'Sale Url',
               thumb: 'Thumb'
             ),
             Bottle.create!(
               name: 'Name',
               grape_variety: 'Grape Variety',
               vintage: 'Vintage',
               sale_url: 'Sale Url',
               thumb: 'Thumb'
             )
           ])
  end

  xit 'renders a list of bottles' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Grape Variety'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Vintage'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Sale Url'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Thumb'.to_s), count: 2
  end
end
