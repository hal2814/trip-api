# Trip API data

##### Prerequisites:
Ruby 2.5.1,
Rails 5

To get started clone this application by running:

```
git clone git@github.com:hal2814/trip-api.git
```

then inside the config folder copy the contents of `example.yml` into a new file called `application.yml` and copy your json data url into the appropriate spot.

run `bundle install` from your command line.

run `rake trips:pull_data` from your command line.

run `rails s` to serve the application on `localhost:3000`
