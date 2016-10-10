require 'rails_helper'

begin
  User
rescue
  User = nil
end

RSpec.describe User, type: :model do

  describe "Class methods" do
    before do
      User.create(username:'user', password:'password')
    end

    it "finds by credentials" do
      found_user = User.find_by_credentials('user', 'password')
      expect(found_user).to_not be nil
    end

    it "generates session_token" do
      expect(User.last.session_token).to_not be nil
    end

  end

  describe "Associations" do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe "Validations" do
    before do
      user = FactoryGirl.create(:user)
    end

    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
  end
end
