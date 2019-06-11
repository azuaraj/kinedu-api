class Api::ActivitylogsController < ApplicationController

  def create
    @activity_log = ActivityLog.create(activity_log_params)
    render json: @activity_log, status: :ok
  end

  def update
    @activity_log = ActivityLog.find(params[:id])
    @activity_log.update(stop_time: params[:stop_time], comments: params[:comments])
    if @activity_log.save
      render json: @activity_log, status: :ok
    else
      render json: @activity_log.errors.details, status: :unprocessable_entity
    end
  end

  private

  def activity_log_params
    params.permit(:baby_id, :assistant_id, :activity_id, :start_time)
  end

end
