require 'rails_helper'

RSpec.describe "pastes/new", type: :view do
  before(:each) do
    assign(:paste, Paste.new())
  end

  it "renders new paste form" do
    render

    assert_select "form[action=?][method=?]", pastes_path, "post" do
    end
  end
end
