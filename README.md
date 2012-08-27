databasedotcom-rails-test
=========================

Demo rails application that you can use for testing with the databasedotcom gem. 

1. You'll need to setup a database.com org with a custom object and recrods. [Setting up a Database.com Org for Remote Access](http://www.youtube.com/watch?v=g77NpsHJgmk&list=UUBjoImvGIJffuqt2nXZLMng&index=1&feature=plcp) walks you through this process.

2. After you cloned this repo, add your OAuth tokens and credentials to the config/databasedotcom.yml file.

3. Test the connection to the database.com org:

<pre>rails console
client = Databasedotcom::Client.new("config/databasedotcom.yml")
client.authenticate :username => YOUR-USERNAME, :password => YOUR-PASSWORD
client.materialize("Account__c")
Account__c.count</pre>

4. Fire up rails and get started.

See [Accessing Salesforce Data from Ruby](http://wiki.developerforce.com/page/Accessing_Salesforce_Data_From_Ruby) for an indepth tutorial.