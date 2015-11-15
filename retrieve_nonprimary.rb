#!/usr/bin/env ruby


require 'csv'
require 'uri'
require 'pg'

uri = URI.parse('postgres://vbzzdosloeskke:8DPMBrS0qFPfF5gRY6MkFvFN9H@ec2-107-21-223-110.compute-1.amazonaws.com:5432/deb8hqfv9kd04o')

begin
        connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
        puts 'connected'
        puts "Enter the Non Primary Key value (1. STABBR 2. CITY)"
        option = gets
        puts option
        case option
	when 1
		col_name = "stabbr"
	when 2
		col_name = "city"
	else
		"You have chosen the wrong option"
	end
	
	puts "Enter the value for the Non Primarykey chosen"
	nonpk=gets

        query = connection.exec("select * from universities where" +  col_name + " =" + nonpk + "" + "limit 20;");
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
