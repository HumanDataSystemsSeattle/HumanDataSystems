Rails.application.routes.draw do

  get 'fitbit/dashboard', to: 'fitbit#dashboard'
  get 'fitbit/callback', to: 'fitbit#callback'
  get 'fitbit/user_data', to: 'fitbit#user_data'

  root to: 'dashboard#landing'

end
