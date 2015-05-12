require 'rails_helper'

RSpec.describe Paste, type: :model do
  let(:paste) { FactoryGirl.create :paste }

  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe "#language" do
    
  end

  describe "#user_id" do
    it { should validate_presence_of(:user_id) }
  end

  describe "#name" do
    it { should validate_length_of(:body).is_at_least(3) }
    it { should validate_length_of(:body).is_at_most(512) }
  end

  describe "#body" do
    it { should validate_presence_of(:body) }
  end

  describe "#expires_at" do
    it "expires in the future" do
      paste.expires_at = Time.now - 1.week

      expect(paste).to be_invalid
    end
  end

  describe "unexpired" do
    let(:unexpired_paste) { FactoryGirl.create :paste, expires_at: Time.now + 1.week }
    let(:expires_at_unset) { FactoryGirl.create :paste }

    it "should only display unexpired pastes" do
      paste.expires_at = Time.now - 1.week
      expires_at_unset.expires_at = nil

      expect(Paste.unexpired.count).to eq(2)
    end
  end
end
