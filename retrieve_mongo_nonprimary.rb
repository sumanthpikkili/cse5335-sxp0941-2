require 'mongo'
require 'csv'

mongo_uri = 'mongodb://heroku_8c77z5bn:s650vnnnpv39p3h8epm0jima98@ds053764.mongolab.com:53764/heroku_8c77z5bn'

begin
    #Connecting to the Mongo Client
    client = Mongo::Client.new([ 'ds053764.mongolab.com:53764' ],:database =>'heroku_8c77z5bn',:user=>'heroku_8c77z5bn',:password=>'s650vnnnpv39p3h8epm0jima98');
    puts "Successfully connected to mongo db"
    
     puts "Enter the Non Primary Key option (a. STABBR b. CITY)"
        option = gets
        puts option
        case option.chomp
	when 'a'
		col_name = :stabbr
		puts "Enter the stabbr value"
		nonpk = gets
	when 'b'
		col_name = :city
		puts "Enter the city value"
		nonpk = gets
	else
		"You have chosen the wrong option"
	end
	
	nonpk=nonpk.chomp    
    

    db = client.database
    college=db.collection('universities')
    puts "Retrieve successful"
    puts "The retrieved data for the primary key value entered is"
    result = college.find({ col_name =>nonpk }).limit(20)
    puts "UNITID | OPEID | OPEID6 | INSTNM | CITY | STABBR | INSTURL"              
    result.each do |document|
  	puts "#{document['unitid']} | #{document['opeid']} | #{document['opeid6']} | #{document['instnm']} | #{document['city']} | #{document['stabbr']} | #{document['insturl']}" 
	
    end
end
