require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  it { expect(comment).to be_valid }

  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:paste) }
  end

  describe "#user_id" do
    it { should validate_presence_of(:user_id) }
  end

  describe "#paste_id" do
    it { should validate_presence_of(:paste_id) }
  end

  describe "#body" do
      it { should validate_presence_of(:body) }
      it { should validate_length_of(:body).is_at_most(512) }
      it { should validate_length_of(:body).is_at_least(3) }
  end
end
