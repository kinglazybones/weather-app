require "yahoo_weatherman"

def weather(location)
    
        client = Weatherman::Client.new(unit: 'f')
    
    temp = client.lookup_by_location(location).condition['temp']
    condition = client.lookup_by_location(location).condition['text']

    puts "The weather right now is #{condition} with a temperature of #{temp} \xC2\xB0F."
    
    
    weather = client.lookup_by_location(location)
    forecasts = weather.forecasts    
    
	
    puts "Here's your 5-day forecast:"
    
    current_day = Time.now.strftime('%w').to_i
            
    forecasts.each do |forecast|
                        
        forecast_day = forecast['date'].strftime('%w').to_i

        
        if current_day == forecast_day
            weekday = 'Today'
        elsif current_day + 1 == forecast_day
            weekday = 'Tomorrow'
        elsif current_day == 6 && forecast_day == 0
            weekday = 'Tomorrow'
        else
            weekday = forecast['day']
        end

        
        puts weekday + "\'s forecast is " + forecast.fetch('text') + " with a low of " + forecast.fetch('low').to_s + "\xC2\xB0F and a high of " + forecast.fetch('high').to_s + "\xC2\xB0F."


    end
        
end

puts "What's your 5-digit zip code?"
zip = gets.chomp

weather(zip)