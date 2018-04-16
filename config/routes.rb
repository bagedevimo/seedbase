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

  resources :competitors
  resources :teams
  resources :team_invites do
    get :accept
  end

  resources :events, param: "event_slug", path: ""

  scope ':event_slug/' do
    resources :scheduled_events, param: "scheduled_slug", path: "", as: "scheduled_event"
  end

  scope ':event_slug/:scheduled_slug/manage', module: "manage", as: "manage_scheduled_event" do
    get '/', controller: 'manage', action: :index
    resources :teams, as: "teams"
    resources :competitors, as: "competitors"
  end
end