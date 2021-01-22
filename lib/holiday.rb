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
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday|
    #find which season has winter 
    if season == :winter 
      #for each holiday add supply to each data array
      holiday.each do |day, data|
        data << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    #find which season has winter 
    if season == :spring 
      holiday_hash[:spring][:memorial_day] << supply
    end
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  #select the given season, equate it to the given holiday name + data
  holiday_hash[season] = {holiday_name => supply_array}
  
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  #values gets all data and flatten returns array
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    #capitalize seasons
    puts "#{season.to_s.capitalize!}:"
    #data manipulation for holiday names and data
    holiday.each do |name, data|
      #empty array to put data
      new_array = []
      array = name.to_s.split("_")
      #capitalize each holiday 
      array.each {|word| new_array << word.capitalize!}
      #join holiday names and data
      name = new_array.join(" ")
      data = data.join(", ")
      puts "  #{name}: #{data}"
      
    end 
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array = []
   holiday_hash.each do |season, holiday|
      holiday.each do |name, supply|
      if supply.include?("BBQ")
         array << name
      end 
    end 
  end 
  array
end







