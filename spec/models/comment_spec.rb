require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:subject) { FactoryGirl.build(:comment) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end
end