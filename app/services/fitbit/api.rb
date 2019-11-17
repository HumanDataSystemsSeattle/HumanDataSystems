module Fitbit

  class Api

    def initialize
    end

    def get_user_profile
      url = ENDPOINTS[:user_profile]

      request(url)
    end

    def get_daily_activity(date)
      url = ENDPOINTS[:daily_activity].gsub(/{:date}/, parse_date(date))

      request(url)
    end

    def get_heart_rate
      url = ENDPOINTS[:heart_rate]

      request(url)
    end

    def get_steps
      url = ENDPOINTS[:step_rate]

      request(url)
    end

    def get_calories
      url = ENDPOINTS[:calorie_rate]

      request(url)
    end

    def get_distances
      url = ENDPOINTS[:distance_rate]

      request(url)
    end

    ENDPOINTS = {
      user_profile: 'https://api.fitbit.com/1/user/-/profile.json',
      daily_activity: 'https://api.fitbit.com/1/user/-/activities/date/{:date}.json',
      heart_rate: 'https://api.fitbit.com/1/user/-/activities/heart/date/today/1d.json',
      step_rate: 'https://api.fitbit.com/1/user/-/activities/steps/date/today/1d.json',
      calorie_rate: 'https://api.fitbit.com/1/user/-/activities/calories/date/today/1d.json',
      distance_rate: 'https://api.fitbit.com/1/user/-/activities/distance/date/today/1d.json'
    }

    def request(url)
      HTTParty.get(url, headers: auth_header)
    rescue Timeout::Error => e
      Airbrake.notify(e)
      nil
    end

    def auth_header
      { 'Authorization' => "Bearer #{ENV['FITBIT_TOKEN']}" }
    end

    def parse_date(date)
      date.strftime('%Y-%m-%d')
    end

  end

end
