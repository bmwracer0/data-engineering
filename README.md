Welcome to *The Importer*
=========================

### Running the app:

After cloning the code, <code>cd</code> into the directory, and run <code>bundle install</code> to pull down the required dependencies. Following the dependency resoultion, run <code>rake db:migrate</code> in order to create the required tables. Finally, start the server with <code>rails server</code>. You can now open your favorite browser, and navigate to <code>localhost:3000</code>. You'll be able to login with your Google account, which is the OpenID provider I chose to implement, since it's one of the most popular account types on the web. It would be trivial to add additional providers. 

### Testing:

You can run the Rspec tests for this application by first running <code>rake db:test:prepare</code> to prepare the database, and then running <code>rspec</code> from the root of the project directory.

### Future:

If this app was to be used in a production environment, it might be recommended to do the processing asyncronously by using a queue or something similar. Parsing the CSV during the request is not optimal from a user's point of view, because large files may appear to make the app unresponsive. In addition to the asyncronous processing, but it might be useful to save the files on disk somewhere for archiving purposes, rather than store the contents of the file in the database.