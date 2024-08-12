require 'rails_helper'

RSpec.describe 'bottles/edit', type: :view do
  let(:bottle) do
    Bottle.create!(
      name: 'MyString',
      grape_variety: 'MyString',
      vintage: 'MyString',
      sale_url: 'MyString',
      thumb: 'MyString'
    )
  end

  before(:each) do
    assign(:bottle, bottle)
  end

  xit 'renders the edit bottle form' do
    render

    assert_select 'form[action=?][method=?]', bottle_path(bottle), 'post' do
      assert_select 'input[name=?]', 'bottle[name]'

      assert_select 'input[name=?]', 'bottle[grape_variety]'

      assert_select 'input[name=?]', 'bottle[vintage]'

      assert_select 'input[name=?]', 'bottle[sale_url]'

      assert_select 'input[name=?]', 'bottle[thumb]'
    end
  end
end
