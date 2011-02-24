class TripsController < ApplicationController

  before_filter :load_trip, :except => [:index, :new, :create]

  def index
    @trips = Trip.all
  end

  def show
  end

  protected

  def load_trip
    @trip = Trip.find(params[:id])
  end

end
