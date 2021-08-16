# frozen_string_literal: true

class ScreeningsController < ApplicationController
  include JSONAPI::Fetching

  def index 
    screenings = Screenings.all
    render jsonapi: screenings
  end
end
