Rails.application.routes.draw do
  root to: "dashboard#index"

  resources :dashboard, only: [:index]

  # Login and registration
  resources :sessions, only: [:new, :create] do
    collection do
      get '/destroy', action: :destroy
    end
  end

  resources :users, only: [:new, :create, :edit, :update]

  resources :events, only: [:index, :new, :create]
  resources :scheduled_events, only: [:create]

  resources :competitors
  resources :teams

  get '/:id', controller: 'events', action: :show, as: 'event'
  patch '/:id', controller: 'events', action: :update
  get '/:id/edit', controller: 'events', action: :edit, as: 'edit_event'

  get '/:event_id/new', controller: 'scheduled_events', action: :new, as: 'new_scheduled_event'
  get '/:event_id/:scheduled_id', controller: 'scheduled_events', action: :show, as: 'scheduled_event'
  patch '/:event_id/:scheduled_id', controller: 'scheduled_events', action: :update
  get '/:event_id/:scheduled_id/edit', controller: 'scheduled_events', action: :edit, as: 'edit_scheduled_event'

  # The entirety of the fucking event mangement area
  scope ':event_id/:scheduled_id/manage', module: "manage" do
    get '/', controller: 'manage', action: :index, as: "manage_scheduled_event"
    resources :teams, as: "manage_scheduled_event_teams"
    resources :competitors, as: "manage_scheduled_event_competitors"
  end

  # get ':event_id/:scheduled_id/manage', controller: 'organiser_panel', action: :index, as: 'manage_scheduled_event'
  # get ':event_id/:scheduled_id/manage/competitors', controller: 'organiser_panel', action: 'competitors', as: 'manage_scheduled_event_competitors'
  # get ':event_id/:scheduled_id/manage/teams', controller: 'organiser_panel', action: 'teams', as: 'manage_scheduled_event_teams'
  # get ':event_id/:scheduled_id/manage/teams/:team_id', controller: 'organiser_panel', action: 'view_team', as: 'manage_scheduled_event_team'
  # delete ':event_id/:scheduled_id/manage/teams/:team_id', controller: 'organiser_panel', action: 'destroy_team', as: 'manage_scheduled_event_team'
end