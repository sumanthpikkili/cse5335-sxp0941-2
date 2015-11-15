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

        query = connection.exec("select * from universities where " +  col_name + "=" + "'" + nonpk + "'" + ";");
	puts query
        puts "The following are your search results based on the non Primary key value that you have given for stabbr"
        query.each {
        unitid=query[0]['unitid']
        opeid=query[0]['opeid']
        opeid6=query[0]['opeid6']
        instnm=query[0]['instnm']
        city=query[0]['city']
        stabbr=query[0]['stabbr']
        insturl=query[0]['insturl']

        p "#{unitid} #{opeid} #{opeid6} #{instnm} #{city} #{stabbr} #{insturl}"
        }

        puts "success"
        connection.close
end
