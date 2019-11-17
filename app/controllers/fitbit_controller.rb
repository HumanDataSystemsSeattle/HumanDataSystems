class FitbitController < ApplicationController

  def dashboard
  end

  def callback
    redirect_to fitbit_dashboard_path
  end

  def user_data
    # render json: Fitbit::Api.new.get_user_profile
  end

  def correlation
    set_heart_data
    set_calorie_data
    set_distance_data

    set_graph_intervals

    set_heart_graph_data
    set_calorie_graph_data
    set_distance_graph_data
  end

  private

  def set_heart_data
    @heart_data = Fitbit::Api.new.get_heart_rate.parsed_response["activities-heart-intraday"]["dataset"]
  end

  def set_calorie_data
    @calorie_data = Fitbit::Api.new.get_calories.parsed_response["activities-calories-intraday"]["dataset"]
  end

  def set_distance_data
    @distance_data = Fitbit::Api.new.get_distances.parsed_response["activities-distance-intraday"]["dataset"]
  end

  def set_graph_intervals
    interval = (@heart_data.count / 60.0).ceil

    @times = []
    i = 0
    @heart_data.each do |d|
      if i % interval == 0
        @times << d['time']
      end

      i += 1
    end
  end

  def set_heart_graph_data
    data_points = {}
    @heart_data.each do |d|
      if @times.include?(d['time'])
        data_points[d['time']] = [d['value']]
      end
    end

    @heart_graph_data = [
      {
        name: 'Heart Rate',
        data: data_points,
        color: '#4E6D88'
      },
    ]
  end

  def set_calorie_graph_data
    data_points = {}
    @calorie_data.each do |d|
      if @times.include?(d['time'])
        data_points[d['time']] = [d['value']]
      end
    end

    @calorie_graph_data = [
      {
        name: 'Calories Burned',
        data: data_points,
        color: '#6EC1FA'
      },
    ]
  end

  def set_distance_graph_data
    data_points = {}
    @distance_data.each do |d|
      if @times.include?(d['time'])
        data_points[d['time']] = [d['value']]
      end
    end

    @distance_graph_data = [
      {
        name: 'Distance Traveled',
        data: data_points,
        color: '#B3DEFC'
      },
    ]
  end

end
