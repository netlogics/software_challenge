# Software Challenge
## The Goals
1. Your app must accept ( via a form ) a tab delimited file with the
   following columns: business
name, address, city, state, postal code, country, latitude, longitude.
The example file is named
offers_poi.tsv is included in this repo.
2. Your app must parse the given file and store the information in a
   database.
3. After upload, your application should display each location ordered
   by distance from the Verve Carlsbad office.
4. (Bonus Points) Provide an api to query for locations near a given
   latitude and longitude.

## Setup
* download and install redis if needed
* redis-server
* git clone https://github.com/netlogics/software-challenge.git
* bundle install
* rake db:setup
* bundle exec sidekiq
* rails server
* browse to localhost:3000/stores/1/locations
* click import locations
* select the locations file offers_poi.tsv
* click upload

## Notes
Import is handled in the background by redis. To check for job errors
tail -f log/sidekiq.log

You may receive errors on import due the the google geocoding api
rate limits. This sample assumes geocoding will be successfull as it was
during development.


