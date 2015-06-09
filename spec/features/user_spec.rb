require "rails_helper"

RSpec.feature "Users", type: :feature do
  let(:subject) { FactoryGirl.create :user }

  describe "the signin process", type: :feature do
    it "signs me in" do
      visit new_user_session_path

      within("#new_user") do
        fill_in 'Email', with: subject.email
        fill_in 'Password', with: subject.password
      end

      click_button 'Log in'
      
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end