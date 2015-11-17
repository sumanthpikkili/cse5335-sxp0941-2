#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'

begin
    #Connecting to Heroku Redis 
    redisConn = Redis.new(:url => "redis://h:p6nbi5m4o72g668u37m11iiuola@ec2-54-83-9-36.compute-1.amazonaws.com:18039") 
    puts 'Successfully connected to the Redis database'    
    puts "Enter the Key value (UNITID)"
    primary_key=gets
    if primary_key.strip! == nil
    query=redisConn.get(primary_key)
    else
    query=redisConn.get(primary_key)
    end
    if unless query.nil? or query == 0  
	 puts "Retrieval Successful"   
 	 puts "the retrieved data for UNITID key :"+primary_key
	 puts " OPEID | opeid6 | INSTNM | CITY | STABBR | INSTURL"
   	 val=JSON.parse(query)
	 if unless val.nil? or query == 0  
   	     puts "#{val[0]} | #{val[1]} | #{val[2]} | #{val[3]} | #{val[4]} | #{val[5]}"	     
         end
         end
    end
    end    
    redisConn.quit
    puts "Connection closed"
end

