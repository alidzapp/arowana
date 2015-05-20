require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  let(:valid_attributes) { (FactoryGirl.build :comment).attributes }

  let(:invalid_attributes) { { comment: { body: "12" } } }

  it "should have a valid session" do
    expect(subject.current_user).to be_valid
  end

  context "with valid attributes" do
    describe "POST #create" do
      it "creates a new comment" do
        expect { post :create, comment: valid_attributes }.to change(Comment, :count)
      end

      it "redirects to its paste" do
        post :create, comment: valid_attributes

        expect(response).to redirect_to(paste_path(Comment.last.paste))
      end
    end
  end

  context "with invalid attributes" do
    describe "POST #create" do
      it "redirects to root path" do
        post :create, comment: invalid_attributes

        expect(response).to redirect_to(root_path)
      end
    end
  end
end