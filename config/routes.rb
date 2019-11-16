Rails.application.routes.draw do

  get 'fitbit/dashboard', to: 'fitbit#dashboard'
  get 'fitbit/callback', to: 'fitbit#callback'

  root to: 'dashboard#landing'

end
