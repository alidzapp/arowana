require 'rails_helper'

RSpec.describe Paste, type: :model do
  let(:subject) { FactoryGirl.build :paste }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  describe "#expires_at" do
    it "expires in the future" do
      subject.expires_at = Time.now - 1.week

      expect(subject).to be_invalid
    end

    it "returns unexpired pastes" do
      subject.save!

      expect(Paste.unexpired.count).to eq(1)
    end
  end
end
