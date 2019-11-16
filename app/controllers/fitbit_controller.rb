class FitbitController < ApplicationController

  def dashboard
  end

  def callback
    render json: { test: 'Test' }.to_json
  end

end
