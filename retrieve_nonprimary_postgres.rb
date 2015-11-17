#!/usr/bin/env ruby


require 'csv'
require 'uri'
require 'pg'

#Parsing the PostGres URI
uri = URI.parse('postgres://vbzzdosloeskke:8DPMBrS0qFPfF5gRY6MkFvFN9H@ec2-107-21-223-110.compute-1.amazonaws.com:5432/deb8hqfv9kd04o')

begin
	#Connecting to the Heroku Postgres database
        connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
        puts 'Successfully Connected to the Postgres database'
	#The dataset has two Non Primary keys. The user can enter the values for each of the fields
        puts "Enter the Non Primary Key option (a. STABBR b. CITY)"
        option = gets
        puts option
        case option.chomp
	when 'a'
		col_name = "stabbr"
		puts "Enter the stabbr value"
		nonpk = gets
	when 'b'
		col_name = "city"
		puts "Enter the city value"
		nonpk = gets
	else
		"Sorry, You have chosen the wrong option"
	end
	
	nonpk=nonpk.chomp
	#Retrieving the records and limiting to 20
        query = connection.exec("select * from universities where " +  col_name + "=" + "'" + nonpk + "'" + " LIMIT 20;");
	puts query
        puts "The following are your search results based on the non Primary key value that you have given for stabbr"
        query.each do |obj| 
        unitid=obj['unitid']
        opeid=obj['opeid']
        opeid6=obj['opeid6']
        instnm=obj['instnm']
        city=obj['city']
        stabbr=obj['stabbr']
        insturl=obj['insturl']

        p "#{unitid} #{opeid} #{opeid6} #{instnm} #{city} #{stabbr} #{insturl}"
        end

        puts "Successfully rerieved"
        connection.close
end
