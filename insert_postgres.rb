

#!/usr/bin/env ruby


require 'csv'
require 'uri'
require 'pg'

#Parse the postgres URI
uri = URI.parse('postgres://vbzzdosloeskke:8DPMBrS0qFPfF5gRY6MkFvFN9H@ec2-107-21-223-110.compute-1.amazonaws.com:5432/deb8hqfv9kd04o')

begin
	#PG Connection..Connect to the host name
	connection = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
	puts 'Connected to the PostGres database'
	#Retrieving from the University CSV File and inserting records into the PostGres Database
	CSV.foreach("sample.csv",:headers => true) do |row|
		query = connection.exec("insert into universities values('" + row[0] + "','" + row[1] + "','" + row[2] + "','" + row[3] + "','" + row[4] + "','" + row[5] + "','" + row[6] + "');");
		
	end
	puts "Insertion Success"
	connection.close
end


