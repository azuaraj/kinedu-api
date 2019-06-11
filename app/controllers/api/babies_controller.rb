class Api::BabiesController < ApplicationController

  def index
    @babies = Baby.all
    render json: @babies, :except => [:created_at, :updated_at], status: :ok
  end

  def baby_activity_logs
    @activities = ActivityLog.where(baby_id: params[:id])
    render json: @activities, status: :ok
  end
end
