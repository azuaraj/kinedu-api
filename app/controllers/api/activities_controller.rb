class Api::ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    render json: @activities, :except => [:created_at, :updated_at], status: :ok
  end
end
