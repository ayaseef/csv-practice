# frozen_string_literal: true

require 'csv'
require 'awesome_print'

# Wave 1
# Created an array of hashes with the data from CSV file

# puts olympic_data

def get_all_olympic_athletes(filename)
  # CSV.read(filename, headers: true).map(&:to_h)
  required_fields = %w[ID Name Height Team Year City Sport Event Medal]
  CSV.read(filename, headers: true).map do |row|
    athlete = {}
    required_fields.each do |field_name|
      athlete[field_name] = row[field_name]
    end
    athlete
  end
end

def total_medals_per_team(olympic_data)
  # print team name as a key "string" => and the value as the count of number of medals for that team.
  team_medals = {}
  olympic_data.each do |athlete|
    country = athlete["Team"] #This is a string -> "Norway"
    medal = athlete["Medal"] #This is either "NA", Silver, Bronze or Gold
    unless medal == "NA"
      medal_count = team_medals[country]
      if medal_count.nil?
        medal_count = 1
      else
        medal_count += 1
      end
      team_medals[country] = medal_count
    end
  end
  team_medals
end

#
# def get_all_gold_medalists(olympic_data)
# end
