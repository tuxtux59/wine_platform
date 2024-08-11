require 'rails_helper'

RSpec.describe 'bottles/show', type: :view do
  before(:each) do
    assign(:bottle, Bottle.create!(
                      name: 'Name',
                      grape_variety: 'Grape Variety',
                      vintage: 'Vintage',
                      sale_url: 'Sale Url',
                      thumb: 'Thumb'
                    ))
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Grape Variety/)
    expect(rendered).to match(/Vintage/)
    expect(rendered).to match(/Sale Url/)
    expect(rendered).to match(/Thumb/)
  end
end
