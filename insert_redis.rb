#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'



begin
    #Connecting to Heroku Redis 
    redisConn = Redis.new(:url => "redis://h:p6nbi5m4o72g668u37m11iiuola@ec2-54-83-9-36.compute-1.amazonaws.com:18039") 
    puts 'Successfully connected to the Redis database'
    CSV.foreach('sample.csv', :headers => true) do |csv_obj|
       redisConn.set csv_obj['UNITID'],[csv_obj['OPEID'],csv_obj['opeid6'],csv_obj['INSTNM'],csv_obj['CITY'],csv_obj['STABBR'],csv_obj['INSTURL']].to_json
    end 
    redisConn.quit
    puts "Insertion Successful"
    
end
