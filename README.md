## CSE5335-Project 2
## Author Name: Sumanth Pikkili
## UTA-ID: 1001100941

###Dataset: sample.csv
###Screenshots of Execution in 'Screenshots' folder

What is your external data source used to populate your Heroku data sources?

    The external data source that I used to populate my data has been picked up from the site http://www.data.gov/developers/apis. The dataset represents a college Scorecards that makes it easier for students to search for a college that is a good fit for them. They can use the College Scorecard to find out more about a college's affordability and value so they can make more informed decisions about which college to attend. 
    

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
    e) retrieve_mongo.rb - Retrieves data from the Mongo database based on the Primary Key provided by the user
    f) retrieve_mongo_nonprimary.rb  - Retrieves data from the Mongo database (and limits to 20 records) based on the Non Primary key provided by the user
    g) insert_redis.rb - Pulls data from the CSV file and inserts it into the Redis database
    h) retrieve_redis.rb - Pulls data from the Redis database based on the Primary Key provided by the user


What aspect of the implementation did you find easy, if any, and why?

    I found inserting and retrieving data from PostGres database easy since PostGres is an SQL database and I have had many years of experience working on SQL databases. I was also able to verify the working of my PostGres scripts by running SQL Queries in the PGSQL CLI on Heroku.
    
What aspect of the implementation did you find hard, if any, and why?

    I found implementing Redis with Ruby difficult because Redis involves Key Value pairs. I faced difficulties when trying to retrive data using keys. Also, the default Ruby version installed on Mac is 2.0.0 and the implementation steps that I followed for Redis required Ruby version 2.2.3. I had to update the Ruby version to 2.2.3 to get Redis working. This update created problems when pushing the code to the heroku server. The command 'bundle install' failed which prevented the deployment to the Heroku server. I had to update the Gemfile to get the deployment working.
    
