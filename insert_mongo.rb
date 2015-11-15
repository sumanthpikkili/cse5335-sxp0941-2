require 'mongo'
require 'csv'

mongo_uri = 'mongodb://heroku_8c77z5bn:s650vnnnpv39p3h8epm0jima98@ds053764.mongolab.com:53764/heroku_8c77z5bn'

begin
    client = Mongo::Client.new([ 'ds053764.mongolab.com:53764' ],:database =>'heroku_8c77z5bn',:user=>'heroku_8c77z5bn',:password=>'s650vnnnpv39p3h8epm0jima98');
    puts "connected to mongo db"
    db = client.database
    db.collection_names.each{|name| puts name }
        college=db.collection('universities')
        
    CSV.foreach('sample.csv', :headers => true) do |csv_obj|
               result=college.insert_one({ :unitid => csv_obj['UNITID'], :opeid => csv_obj['OPEID'], :opeid6 => csv_obj['opeid6'], :instnm => csv_obj['INSTNM'], :city => csv_obj['CITY'], :stabbr => csv_obj['STABBR'], :insturl => csv_obj['INSTURL']})
                
        end    
        puts "insertion into mongo db done"

end
