require 'spec_helper'

describe Hotel do
  before do
    @detroit = Factory.create(:city, :name => "Detroit")
  end

  describe "validations" do

    it "should be valid with valid attributes" do
      # Not using a factory here to make validation more explicit
      @hotel = Hotel.new(:name => "The St. Clair", :city => @detroit)
      @hotel.should be_valid
    end

    describe "invalid cases" do
      before do
        @hotel = Hotel.new
        @hotel.should_not be_valid
      end

      it "should not be valid" do
        lambda {@hotel.save!}.should raise_error(ActiveRecord::RecordInvalid)
      end

      it "should not be valid without a name" do
        @hotel.errors.full_messages.should include("Name can't be blank")
      end

      it "should not be valid with a name shorter than 2 characters" do
        @hotel.errors.full_messages.should include("Name is too short (minimum is 2 characters)")
      end

      it "should have a city" do
        @hotel.errors.full_messages.should include("City can't be blank")
      end
    end
  end

  it "should have many trips" do
    Hotel.new.should respond_to(:trips)
  end

  describe "#yet_to_visit" do
    before do
      @visited_hotel = Factory.create(:hotel, :visited => true)
      @unvisited_hotel = Factory.create(:hotel, :visited => false)
    end

    it "should return unvisited hotels" do
      Hotel.yet_to_visit.should eq([@unvisited_hotel])
    end
  end

end
