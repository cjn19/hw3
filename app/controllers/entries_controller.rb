class EntriesController < ApplicationController
  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["place_id"]})
  end

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    # New entry filling
    @entry = Entry.new

    # Allocate filled-in data to Entry's columns
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["date"]

    # Link Place and Entry
    @entry["place_id"] = params["place_id"]

    # save
    @entry.save

    # Redirection
    redirect_to "/places/#{@entry["place_id"]}"
  end
end
