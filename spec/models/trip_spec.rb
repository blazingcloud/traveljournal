require 'spec_helper'

describe Trip do

  it "should save a valid trip" do
    now = Time.now
    @trip = Trip.create(:name => "some trip", :date => now)
    Trip.find_by_name("some trip").should == @trip
  end

  it "should require a date" do
    @trip = Trip.new(:name => "some trip")
    @trip.save.should be_false
  end

  it "should require a name" do
    @trip = Trip.new(:date => Time.now)
    @trip.save.should be_false
  end

  it "should require name to be at least two characters" do
    @trip = Trip.new(:name => "s", :date => Time.now)
    @trip.save.should be_false
  end

  it "should have a hotel" do
    @trip = Trip.new
    @trip.should respond_to(:hotel)
  end
end
