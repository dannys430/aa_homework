require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject(:mariah) {User.new(email: 'mc@gmail.com', password: 'dembabies')}

  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}
  
  describe "#is_password?" do
    it "verifies if password is correct" do
      expect(mariah.is_password?('dembabies')).to be true
    end

    it "verifies if password is NOT correct" do
      expect(mariah.is_password?('password123')).to be false
    end
  end

  describe "#reset_session_token" do
    before(:each) {mariah.session_token = 12345}
      it "generates a new session token for the user" do
        expect(mariah.session_token).to_not eq(12345)
      end
  end

  # describe "::find_by_credentials" do
  #   before(:each) {User.find_by_credentials('mc@gmail.com', 'dembabies')}
  #   it "finds a user by their credentials (email and password)" do
  #     expect(
  #   end
  # end

   
end
