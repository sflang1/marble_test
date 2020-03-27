# How to run
```bash
bundle install # Install dependencies
rake db:migrate # Run migrations
rackup # Start server
```

# Endpoints
## POST /api/movies
Params:
```json
{
  'movie': {
    'name: 'String',
    'description': 'String',
    'image_url': 'String',
    'days_presented': 'String that matches with the regex /^L?M?X?J?V?S?D?$/
  }
}
```

Result:
```json
{code: 'success', id: The id of the movie created} // If succeeded
{code: 'error', message: information about what failed} // if failed
```

## GET api/movie/:day
Params:
Day must be one of 'LMXJVSD'

Result:
```json
{code: 'success', response: Array of movies on that day} // If suceeded
{code: 'error', message: information of what failed} // If failed
```

## POST /api/reservations
Params:
```json
{
  "reservation": {
    "date": A date in format DD-MM-YYYY,
    "movie_id": Movie Id
  }
}
```

Result:
```json
{code: 'success', response: The id of the reservation created}
```

## GET /api/reservations
Params:
```json
{
  "start_date": A date in format DD-MM-YYYY,
  "end_date": A date in format DD-MM-YYYY
}
```

Result:
```json
{code: 'success', response: Array of reservations between these dates}
```