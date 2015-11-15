#!/usr/bin/env ruby


require 'csv'
require 'uri'
require 'pg'

uri = URI.parse('postgres://vbzzdosloeskke:8DPMBrS0qFPfF5gRY6MkFvFN9H@ec2-107-21-223-110.compute-1.amazonaws.com:5432/deb8hqfv9kd04o')

begin
        connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
        puts 'connected'
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
		"You have chosen the wrong option"
	end
	
	nonpk=nonpk.chomp

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

        puts "success"
        connection.close
end
