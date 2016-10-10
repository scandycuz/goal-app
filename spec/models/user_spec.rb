require 'rails_helper'
begin
  User
rescue
  User = nil
end

RSpec.describe User, type: :model do

  # before(:each) do
  #   user = FactoryGirl.create(:user)
  # end

  describe "password encryption" do
    it "does not save password to database" do
      known_password = FactoryGirl.create(:user, password: "password" )
      expect(known_password.password).not_to be("password")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "jack_bruce", password: "abcdef")
    end
  end

  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:session_token) }
end
