require 'spec_helper'

describe Hotel do

  it "should be valid with valid attributes" do
    @hotel = Hotel.new(:name => "Travelodge")
    @hotel.should be_valid
  end

  it "should not be valid without a name" do
    @hotel = Hotel.new
    @hotel.should_not be_valid
  end

  it "should not be valid with a name shorter than 2 characters" do
    @hotel = Hotel.new(:name => "A")
    @hotel.should_not be_valid
  end

  it "should ensure that all hotel names are in title case" do
    @hotel = Hotel.new(:name => "the lowercase lodging house")
    @hotel.save.should be_true
    @hotel.name.should == "The Lowercase Lodging House"
  end

  it "should have a city" do
    @hotel = Hotel.new()
    @hotel.should respond_to(:city)
  end

  it "should return visited hotels" do
    @visited_hotel = Hotel.create(
      :name => "Been There Motel", :visited => true
    )
    @unvisited_hotel = Hotel.create(
      :name => "Let's Go Lodge", :visited => false
    )
    Hotel.yet_to_visit.should eq([@unvisited_hotel])
  end

  it "should be able to have many hotels" do
    @trip1 = Trip.create(:name => "some trip", :date => Time.now)
    @trip2 = Trip.create(:name => "some other trip", :date => 1.day.ago)
    @hotel = Hotel.create(:name => "immaculate inn")
    @hotel.trips << @trip1
    @hotel.trips << @trip2
    Hotel.find(@hotel.id).trips.length.should == 2
  end
end
