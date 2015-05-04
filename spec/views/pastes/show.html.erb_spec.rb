require 'rails_helper'

RSpec.describe "pastes/show", type: :view do
  before(:each) do
    @paste = assign(:paste, Paste.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
