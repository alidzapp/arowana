require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:comment)
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  it "should have a valid session" do
    expect(subject.current_user).to be_valid
  end
end