Rails.application.routes.draw do

  get 'fitbit/dashboard', to: 'fitbit#dashboard'
  get 'fitbit/callback', to: 'fitbit#callback'
  get 'fitbit/user_data', to: 'fitbit#user_data'
  get 'fitbit/correlation', to: 'fitbit#correlation'

  root to: 'dashboard#landing'

end
