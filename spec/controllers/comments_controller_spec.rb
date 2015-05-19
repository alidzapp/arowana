require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:comment)
  }

  it "should have a valid session" do
    expect(subject.current_user).to be_valid
  end

  describe "POST #create" do
    it "creates a new Comment" do
      expect {
        post :create, { comment: valid_attributes}
      }.to change(Comment, :count).by(1)
    end
  end
end