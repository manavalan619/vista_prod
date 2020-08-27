require 'rails_helper'

RSpec.describe 'partners/roles/edit', type: :view do
  let(:user) { create(:branch_manager) }

  before(:each) do
    @role = assign(:role, create(:role, business_unit: user.assigned_business_units.first))
    allow(view).to receive(:current_staff_member).and_return(user)
  end

  it 'renders the edit role form' do
    render

    assert_select 'form[action=?][method=?]', url_for([:partners, @role]), 'post' do
      assert_select 'input[name=?]', 'role[name]'
    end
  end
end
