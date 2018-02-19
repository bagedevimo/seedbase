class ScheduledEventsController < ApplicationController
  before_action :find_scheduled_event, only: [:show, :edit, :update]
  before_action :authenticate_organiser!

  def show; end

  def new
    @save_path = event_schedule_index_path
    @scheduled_event = @event.scheduled_events.new
  end

  def create
    @save_path = event_schedule_index_path
    @scheduled_event = @event.scheduled_events.new(scheduled_event_params)

    if @scheduled_event.save
      redirect_to event_schedule_path(@event, @scheduled_event) and return
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scheduled_event.update_attributes(scheduled_event_params)
      redirect_to scheduled_event_path(@event, @scheduled_event), notice: "Changes saved" and return
    else
      render :edit
    end
  end

  private

  def find_scheduled_event
    @event = Event.find_by_slug(params[:event_id])
    @scheduled_event = @event.scheduled_events.find_by_slug(params[:id])
    @event = @scheduled_event.event
  end

  def scheduled_event_params
    params.require(:scheduled_event).permit(
      :name,
      :starts_at,
      :ends_at,
      :location_text,
      :lat,
      :long,
      :maximum_team_size,
      :signups_open_at,
      :signups_close_at
    )
  end
end
