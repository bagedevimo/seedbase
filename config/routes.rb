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

  resources :competitors
  resources :teams

  get '/:id', controller: 'events', action: :show, as: 'event'
  patch '/:id', controller: 'events', action: :update
  get '/:id/edit', controller: 'events', action: :edit, as: 'edit_event'

  get '/:event_id/:id', controller: 'scheduled_events', action: :show, as: 'scheduled_event'
  patch '/:event_id/:id', controller: 'scheduled_events', action: :update
  get '/:event_id/:id/edit', controller: 'scheduled_events', action: :edit, as: 'edit_scheduled_event'
end