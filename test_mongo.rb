#!/usr/bin/ruby

# Copyright (c) 2015 ObjectLabs Corporation
# Distributed under the MIT license - http://opensource.org/licenses/MIT

# Written with mongo 1.9.2
# Documentation: http://api.mongodb.org/ruby/
# A ruby script connecting to a MongoDB database given a MongoDB Connection URI.

require "mongo"
require "json"

### Create seed data

seed_data = [
  {
    'decade' => '1970s',
    'artist' => 'Debby Boone',
    'song' => 'You Light Up My Life',
    'weeksAtOne' => 10
  },
  {
    'decade' => '1980s',
    'artist' => 'Olivia Newton-John',
    'song' => 'Physical',
    'weeksAtOne' => 10
  },
  {
    'decade' => '1990s',
    'artist' => 'Mariah Carey',
    'song' => 'One Sweet Day',
    'weeksAtOne' => 16
  }
]

### Standard URI format: mongodb://[dbuser:dbpassword@]host:port/dbname

uri = "mongodb://heroku_8c77z5bn:s650vnnnpv39p3h8epm0jima98@ds053764.mongolab.com:53764/heroku_8c77z5bn"

#client = MongoClient.from_uri(uri)

client = Mongo::Client.new([uri])
puts 'success'
#result = client[:artists].insert_many([
#  { :name => 'Flying Lotus' },
#  { :name => 'Aphex Twin' }
#])

#client[:artists].find(:name => 'Flying Lotus').each do |document|
  #=> Yields a BSON::Document.
#end


#db_name = uri[%r{/([^/\?]+)(\?|$)}, 1]
#db = client.db(db_name)

# First we'll add a few songs. Nothing is required to create the songs 
# collection; it is created automatically when we insert.

#songs = db.collection("songs")

# Note that the insert method can take either an array or a single dict.

#songs.insert(seed_data)

# Then we need to give Boyz II Men credit for their contribution to
# the hit "One Sweet Day"

#query = { 'song' => 'One Sweet Day' }

#songs.update(query, { '$set' => { 'artist' => 'Mariah Carey ft. Boyz II Men' } })

# Finally we run a query which returns all the hits that spent 10 or
# more weeks at number 1

#cursor = songs.find({ 'weeksAtOne' => { '$gte' => 10 } }).sort('decade', 1)

#cursor.each{ |doc| puts "In the #{ doc['decade'] }," +
 #                       " #{ doc['song'] } by #{ doc['artist'] }" +
 #                       " topped the charts for #{ doc['weeksAtOne'] }" +
 #                       " straight weeks." }

### Since this is an example, we"ll clean up after ourselves.

#songs.drop()

### Only close the connection when your app is terminating

client.close()
