require 'mongo'
require 'csv'

mongo_uri = 'mongodb://heroku_8c77z5bn:s650vnnnpv39p3h8epm0jima98@ds053764.mongolab.com:53764/heroku_8c77z5bn'

begin
    client = Mongo::Client.new([ 'ds053764.mongolab.com:53764' ],:database =>'heroku_8c77z5bn',:user=>'heroku_8c77z5bn',:password=>'s650vnnnpv39p3h8epm0jima98');
    puts "connected to mongo db"
    db = client.database
    college=db.collection('universities')
    puts "Enter the primary key value"
    pk = gets
    if pk.strip! == nil
	puts "Retrieve successful"
	puts "The retrieved data for the primary key value entered is"
	result = college.find({ :unitid =>primary_key })              
        end
  	result.each{

	puts result
	}
        puts "insertion into mongo db done"

end
