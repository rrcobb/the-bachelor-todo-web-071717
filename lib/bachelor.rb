def get_first_name_of_season_winner(data, season)
    data[season].find { |contestant| contestant['status'] == 'Winner' }['name'].split.first
end

def get_contestant_name(data, occupation)
  data.values.flatten.find { |contestant| contestant['occupation'] == occupation }['name']
end

def count_contestants_by_hometown(data, hometown)
  data.values.flatten.select { |contestant| contestant['hometown'] == hometown }.length
end

def get_occupation(data, hometown)
  data.values.flatten.find { |contestant| contestant['hometown'] == hometown }['occupation']
end

def get_average_age_for_season(data, season)
  data[season].map { |contestant| contestant['age'].to_f }.each_with_index.reduce(0) do |avg, (val, i)|
    (avg*(i) + val) / (i+1)
  end.round
end
