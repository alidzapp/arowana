require 'rails_helper'

RSpec.describe PastesController, type: :controller do
  login_user

  let(:valid_attributes) { FactoryGirl.attributes_for(:paste) }

  let(:invalid_attributes) { { paste: { body: "1" } } }

  it "should have a valid session" do
    expect(subject.current_user).to be_valid
  end

  context "with valid attributes" do
    describe "GET #show" do
      
    end

    describe "GET #new" do
      
    end

    describe "api"

    describe "POST #create" do
      it "creates a new paste" do
        expect { post :create, paste: valid_attributes }.to change(Paste, :count) 
      end

      it "redirects to a new paste" do
        post :create, paste: valid_attributes

        expect(response).to redirect_to(new_paste_path)
      end
    end

    describe "POST #update" do

    end
  end

  context "with invalid attributes" do
    describe "POST #create" do
      it "redirects to root path" do
        post :create, paste: invalid_attributes

        expect(response).to render_template(:new)
      end
    end
  end
end