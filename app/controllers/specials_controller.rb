class SpecialsController < ApplicationController
  def index
    @special = Special.all
  end 
end
