Rails.application.routes.draw do
  root to: "dashboard#index"

  resources :dashboard, only: [:index]

  # Login and registration
  resources :sessions, only: [:new, :create] do
    collection do
      get '/destroy', action: :destroy
    end
  end

  resources :users, only: [:new, :create]

  resources :events, except: [:show] do
    get '/panel', controller: 'organiser_panel', action: :index

    resources :schedule, controller: 'scheduled_events', except: [:index] do
      resources :competitors
      resources :teams
    end
  end

  get '/:event_name', controller: 'events', action: :show, as: "named_event"
end