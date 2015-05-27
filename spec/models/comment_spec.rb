require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryGirl.build(:comment) }

  it { expect(comment).to be_valid }
end