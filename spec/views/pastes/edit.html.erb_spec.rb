require 'rails_helper'

RSpec.describe "pastes/edit", type: :view do
  before(:each) do
    @paste = assign(:paste, Paste.create!())
  end

  it "renders the edit paste form" do
    render

    assert_select "form[action=?][method=?]", paste_path(@paste), "post" do
    end
  end
end
