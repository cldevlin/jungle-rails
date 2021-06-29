require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    User.create(first_name:"Sally", last_name: "Mcgee",  email: 'sally@mcgee.com', password: '1234', password_confirmation: '1234')
  end

  describe 'Validations' do
    it 'should require a first name' do
      @user = User.new({"first_name"=>nil, "last_name"=>"Smith", "email"=>"bob@smith.com", "password"=>"123", "password_confirmation"=>"123"})
      expect(@user.save).to be_falsy
    end

    it 'should require a last name' do
      @user = User.new({"first_name"=>"Bob", "last_name"=>nil, "email"=>"bob@smith.com", "password"=>"123", "password_confirmation"=>"123"})
      expect(@user.save).to be_falsy
    end

    it 'should require an email address' do
      @user = User.new({"first_name"=>"Bob", "last_name"=>"Smith", "email"=>nil, "password"=>"123", "password_confirmation"=>"123"})
      expect(@user.save).to be_falsy

    end

    it 'should validate that the password_confirmation matches the password' do
      @user = User.new({"first_name"=>"Bob", "last_name"=>"Smith", "email"=>"bob@smith.com", "password"=>"123", "password_confirmation"=>"456"})
      expect(@user.save).to be_falsy
      expect(@user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
    end

    it 'should check that the email is unique' do
      @user = User.new({"first_name"=>"Bob", "last_name"=>"Smith", "email"=>"bob@smith.com", "password"=>"123", "password_confirmation"=>"123"})
      @user.save
      @user2 = User.new({"first_name"=>"Bob", "last_name"=>"Smith", "email"=>"bob@smith.com", "password"=>"123", "password_confirmation"=>"123"})
      # @user2.save
      # @user2.inspect  
      # puts @user.email
      # puts User.find_by_email(@user.email).inspect
      expect(@user2.save).to be_falsy
    end

    it 'should validate that the password has a minimum length' do
      @user = User.new({"first_name"=>"Bob", "last_name"=>"Smith", "email"=>"bob@smith.com", "password"=>"12", "password_confirmation"=>"12"})
      expect(@user.save).to be_falsy
      expect(@user.errors.messages[:password]).to eq ["is too short (minimum is 3 characters)"]
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should accept valid credentials' do
      byebug
      @user = User.find_by email: "sally@mcgee.com"
      # @user = User.authenticate_with_credentials("sally@mcgee.com", "123")
      # @user = User.new({"first_name"=>"Sally", 
      #   "last_name"=>"McGee", 
      #   "email"=>"  sally@mcgee.com", 
      #   "password"=>"1234", 
      #   "password_confirmation"=>"1234"})
      puts @user.inspect
      expect(@user).to be_truthy
    end

    it 'should reject invalid credentials' do
      # TO DO
    end
  end
end
