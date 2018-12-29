require 'pry'

def get_first_name_of_season_winner(data, season)
  data.fetch(season).find { |contestant| contestant["status"] == "Winner"}["name"].split.first
end

def all_contestants(data)
  all_contestants = []
  data.each {|season, contestant| all_contestants.concat(contestant) }
  all_contestants
end

def get_contestant_name(data, occupation)
  all_contestants(data).find {|contestant| contestant["occupation"] == occupation}["name"]
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).count {|contestant| contestant["hometown"] == hometown}
end

def get_occupation(data, hometown)
  all_contestants(data).find {|contestant| contestant["hometown"] == hometown}["occupation"]
end

def get_average_age_for_season(data, season)
  season_data = data.fetch(season)
  (season_data.reduce(0) { |sum, contestant|
      sum + contestant["age"].to_f
  } / season_data.length).round

end
