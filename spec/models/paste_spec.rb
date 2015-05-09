require 'rails_helper'

RSpec.describe Paste, type: :model do
  let(:paste) { build(:paste) }

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
    context "expires in the future" do
      paste = FactoryGirl::build(:paste, expires_at: Time.now )

      it { expect(subject).to be_invalid }
    end
  end
end
