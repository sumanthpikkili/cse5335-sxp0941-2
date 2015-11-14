#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'



begin 
    redisConn = Redis.new(:url => "redis://h:p6nbi5m4o72g668u37m11iiuola@ec2-54-83-9-36.compute-1.amazonaws.com:18039") 
    puts 'connection success'
    CSV.foreach('/Users/sumanthpikkili/Desktop/sample.csv', :headers => true) do |csv_obj|
       redisConn.set csv_obj['UNITID'],[csv_obj['OPEID'],csv_obj['opeid6'],csv_obj['INSTNM'],csv_obj['CITY'],csv_obj['STABBR'],csv_obj['INSTURL']].to_json
    end 
    redisConn.quit
    puts "completed insertion"
    
end
