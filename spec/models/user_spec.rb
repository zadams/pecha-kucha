require File.dirname(__FILE__) + '/../spec_helper'

describe "user" do
  before(:each) do
    @opts = {:password => 'test1234', :password_confirmation => 'test1234'}
  end
  
  ['primedia','apartmentguide','rentals'].each do |domain|
    it "should validate that email address contains #{domain} domain" do
      @opts.merge!(:email => "user@#{domain}.com")
      User.create!(@opts).should be_true
    end
  end
  
  it "should validate that when bogus domain" do
    @opts.merge!(:email => "user@whatever.com")
    u = User.new(@opts)
    u.save.should be_false
  end
end