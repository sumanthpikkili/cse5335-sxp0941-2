#!/usr/bin/env ruby


require 'csv'
require 'uri'
require 'pg'

uri = URI.parse('postgres://vbzzdosloeskke:8DPMBrS0qFPfF5gRY6MkFvFN9H@ec2-107-21-223-110.compute-1.amazonaws.com:5432/deb8hqfv9kd04o')

begin
        connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
        puts 'Connected to the PostGres database'
	#Program takes user input as the Primary key
	puts "Enter the Primary Key value"
	pk = gets
	#Executing the query to retrieve the universities, given the primary key value as entered by the user
        query = connection.exec("select * from universities where unitid =" + pk + ";");
        puts "The following are your search results based on the Primary key value that you have given"
	query.each {
	unitid=query[0]['unitid']
	opeid=query[0]['opeid']
	opeid6=query[0]['opeid6']
	instnm=query[0]['instnm']
	city=query[0]['city']
	stabbr=query[0]['stabbr']
	insturl=query[0]['insturl']
	#Printing the values retrieved
	p "#{unitid} #{opeid} #{opeid6} #{instnm} #{city} #{stabbr} #{insturl}"
	}
 
        puts "Retrieve Success"
        connection.close
end
