require 'mongo'
puts Gem.loaded_specs["mongo"].version

mongo_uri = ['mongodb://heroku_8c77z5bn:s650vnnnpv39p3h8epm0jima98@ds053764.mongolab.com:53764/heroku_8c77z5bn']
client = Mongo::Client.new(mongo_uri);
db = client.database
db.collection_names.each{|name| puts name }
