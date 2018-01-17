# GEO Tech Exercise

### How to run the app:
To install all the ruby gems required for this application run the following command in your terminal (MacOS):

```
bundle install
```

In order to locally host the server for this app run the following command in your terminal from the root directory:

```
rackup
```

Enter the following url in your browser with a device name after the final / to view the notes for that device:

http://localhost:9292/devices/

An example with the device name would be:

http://localhost:9292/devices/ct

To run the tests for this app change directory into the service-object-model and run the following command in your terminal (after hosting the server locally):

```
rspec
```

### What does the app do:
This application allows a user to make a request to a server with the name of a device as a parameter. The app will then return the notes for the device as a JSON object by parsing the data from an xml file and checking the name provided by the user against all the names in the file and returning the corresponding notes.

Sinatra was used to build the web application and the Nokogiri gem was used to parse the xml.

Tests have been written in the service object model directory to check that the data being returned by the server is the correct format. RSpec was used to run these tests.

The tests currently use a static value for the name which can be changed in the notes_by_name_service_spec.rb file to check for a different device. This can be found in the before hook.

### Time Spent on this test:
I spent about 3 hours and 40 minutes on this code.

I spent the first 2 hours setting up the Sinatra app and parsing the correct data from the xml file into a format I could use to then convert into JSON and display on the web page.

I spent about an hour and 20 minutes creating the service object model to call the data from the server and test against the data returned.

The remaining time was spent cleaning up the code and writing this readme.
