require 'spec_helper'

describe "Trips" do
  describe "listing trips" do
    before do
      @trip1 = Factory(:trip, :name => "Summer vacation", :description => "It was fun!")
      @trip2 = Factory(:trip, :name => "Spring break")
      visit "/trips"
    end

    it "should list the same number of trips as we have" do
      page.all("ul li").should have(2).trips
    end

    it "should list our trips by name" do
      trip_names = page.all("ul li").map(&:text)
      trip_names.should include("Summer vacation")
      trip_names.should include("Spring break")
    end

    describe "when clicking on a trip" do
      before do
        click_link "Summer vacation"
      end

      it "should show details about the trip" do
        page.find('h1').should have_content("Summer vacation")
        page.find('p').should have_content("It was fun!")
      end
    end
  end

end
