require 'rails_helper'

RSpec.describe 'bottles/new', type: :view do
  before(:each) do
    assign(:bottle, Bottle.new(
                      name: 'MyString',
                      grape_variety: 'MyString',
                      vintage: 'MyString',
                      sale_url: 'MyString',
                      thumb: 'MyString'
                    ))
  end

  it 'renders new bottle form' do
    render

    assert_select 'form[action=?][method=?]', bottles_path, 'post' do
      assert_select 'input[name=?]', 'bottle[name]'

      assert_select 'input[name=?]', 'bottle[grape_variety]'

      assert_select 'input[name=?]', 'bottle[vintage]'

      assert_select 'input[name=?]', 'bottle[sale_url]'

      assert_select 'input[name=?]', 'bottle[thumb]'
    end
  end
end
