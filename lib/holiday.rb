require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
 holiday_hash.each do |season, holiday_list|
 if season == :winter
 holiday_list.each do |list, items|
 items.push(supply)
 end
 end
 end
 return holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday_list|
  if season == :spring
  holiday_list.each do |holiday, item|
  item.push(supply)
  end
  end
  end
  return holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, holiday_list|
  if season == :winter
  holiday_list.each do |holiday, list|
  winter_supplies.push(list)
  end
  end
  end
  return winter_supplies.join(", ")
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday_list|
  puts (season.to_s.capitalize + ":".chomp)
  holiday_list.each do |holiday, list|
  holiday_s = holiday.to_s
  puts "  " + holiday_s.split("_").collect(&:capitalize).join(" ") + ": " +  list.join(", ")
  end
  end
end


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_names = []
  holiday_hash.each do |season, holiday_list|
  holiday_list.each do |holiday, supplies|
  supplies.each do |item|
  if item == "BBQ"
  holiday_names.push(holiday)
  end
  end
  end
  end
  return holiday_names
end
