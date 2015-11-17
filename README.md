### CSE5335-Project1
### Author Name: Sumanth Pikkili
### UTA-ID: 1001100941


What is your external data source used to populate your Heroku data sources?

    The external data that I used to populate my data has been picked up from the site http://www.data.gov/developers/apis. The dataset represents a college Scorecards that makes it easier for students to search for a college that is a good fit for them. They can use the College Scorecard to find out more about a college's affordability and value so they can make more informed decisions about which college to attend. 
    

What are the Heroku toolbelt commands to execute the scripts?

    The commands that I used to push the code to Heroku are:
    git add .
    git commit -m "Pushed"
    git push heroku master
    heroku run ruby <scriptname>


    The following scripts need to be run:
    a) insert_postgres.rb -  Pulls data from the CSV file and inserts it into the PostGres database
    b) retrieve_postgres.rb  - Retrieves data from the postgres database based on the Primary key provided by the user
    c) retrieve_postgres_nonprimary.rb - Retrieves data (and limits to 20 elements) from the postgres based on the Non Primary key provided by the user
    d) insert_mongo.rb - Pulls data from the csv file and inserts it into the mongo database
    e) retrieve_mongo.rb - Retrieves data from the Mongo database and based on the Primary Key provided by the user
    f) retrieve_mongo_nonprimary.rb  - Retrieves data from the Mongo database (and limits to 20 records) based on the Non Primary key provided by the user
    g) insert_redis.rb - Pulls data from the CSV file and inserts it into the Redis database
    h) retrieve_redis.rb - Pulls data from the redis database based on the Primary Key provided by the user
