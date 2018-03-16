class EventsController < ApplicationController
  before_action :find_event, except: [:index, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_organiser!, except: [:index, :show, :new, :create]

  def index
    @events = Event.all.active
  end

  def show
    @upcoming_scheduled_events = @event.scheduled_events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.slug = @event.name.parameterize

    ActiveRecord::Base.transaction do
      @event.save!
      @event.organisers.create! user: current_user
      redirect_to @event and return
    end

    render :new
  end

  def edit; end

  def update
    @event.update_attributes(event_params)
    redirect_to edit_event_path(@event), notice: "Changes saved"
  end

  private

  def find_event
    @event = Event.find_by_slug(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :banner)
  end
end
