class EventsController < ApplicationController
  before_action :find_event, except: [:index, :new, :create, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_organiser!, except: [:index, :show]

  def index
    @events = Event.all.active
  end

  def show
    @event = Event.where("lower(events.name) = '#{params[:event_name]}'").first
    @scheduled = @event.scheduled_events.next_first.first
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    ActiveRecord::Base.transaction do
      if @event.save
        @event.organisers.create! user: current_user
        redirect_to @event
      else
        rollback
        render :new
      end
    end
  end

  def edit; end

  def update
    @event.update_attributes(event_params)
    redirect_to event_panel_path(@event), notice: "Changes saved"
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :banner)
  end
end
