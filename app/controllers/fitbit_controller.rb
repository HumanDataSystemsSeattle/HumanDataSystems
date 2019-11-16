class FitbitController < ApplicationController

  def dashboard
  end

  def callback
    session[:fitbit_token] = params[:access_token]

    redirect_to fitbit_dashboard_path
  end

  def user_data
    render json: Fitbit::Api.new.get_user_profile
  end

end
