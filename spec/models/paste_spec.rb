require 'rails_helper'

RSpec.describe Paste, type: :model do
  let(:paste) { FactoryGirl.create :paste }

  describe "#expires_at" do
    it "expires in the future" do
      paste.expires_at = Time.now - 1.week

      expect(paste).to be_invalid
    end
  end

  describe "unexpired" do
    let(:unexpired_paste) { FactoryGirl.create :paste, expires_at: Time.now + 1.week }
    let(:expires_at_unset) { FactoryGirl.create :paste }

    it "only displays unexpired pastes" do
      paste.expires_at = Time.now - 1.week
      expires_at_unset.expires_at = nil

      expect(Paste.unexpired.count).to eq(2)
    end
  end
end
