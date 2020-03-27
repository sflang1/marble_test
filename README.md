# Endpoints
## POST /api/movies
Params:
{
  'movie': {
    'name: 'String',
    'description': 'String',
    'image_url': 'String',
    'days_presented': 'String that matches with the regex /^L?M?X?J?V?S?D?$/
  }
}

Result:
{code: 'success', id: The id of the movie created}
{code: 'error', message: information about what failed}


## GET api/movie/:day
Params:
Day must be one of 'LMXJVSD'

Result:
{code: 'success', response: Array of movies on that day}
{code: 'error', message: information of what failed}

## POST /api/reservations
Params:
{
  "reservation": {
    "date": A date in format DD-MM-YYYY,
    "movie_id": Movie Id
  }
}

Result:
{code: 'success', response: The id of the reservation created}

## GET /api/reservations
Params:
{
  "start_date": A date in format DD-MM-YYYY,
  "end_date": A date in format DD-MM-YYYY
}

Result:
{code: 'success', response: Array of reservations between these dates}