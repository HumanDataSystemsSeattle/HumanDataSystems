module Fitbit

  include HTTParty

  class Api

    def initialize
    end

    def get_user_profile
      response = request(:user_profile)
    end

    attr_reader

    ENDPOINTS = {
      user_profile: 'https://api.fitbit.com/1/user/-/profile.json'
    }

    def request(endpoint)
      HTTParty.get(ENDPOINTS[endpoint], headers: auth_header)
    rescue Timeout::Error => e
      Airbrake.notify(e)
      nil
    end

    def auth_header
      { 'Authorization' => "Bearer #{session[:fitbit_token]}" }
    end

  end

end
