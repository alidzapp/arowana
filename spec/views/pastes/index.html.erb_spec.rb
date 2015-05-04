require 'rails_helper'

RSpec.describe "pastes/index", type: :view do
  before(:each) do
    assign(:pastes, [
      Paste.create!(),
      Paste.create!()
    ])
  end

  it "renders a list of pastes" do
    render
  end
end
