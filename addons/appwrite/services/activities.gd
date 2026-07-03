extends "../utils/service.gd"
## Service class.


## List all events for selected filters.[br]
##[br]
## Parameters:[br]
## - [param queries] [String]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on attributes such as userId, teamId, etc.[br]
##[br]
## Returns:[br]
## - [AppwriteActivityEventList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_events(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is String:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected String.", 0, "argument_error", "")

    var _path := '/activities/events'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteActivityEventList


    return await _call('get', _path, _headers, _params, model_script)


## Get event by ID.[br]
##[br]
##[br]
## Parameters:[br]
## - [param event_id] [String]: Event ID.[br]
##[br]
## Returns:[br]
## - [AppwriteActivityEvent] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_event(event_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/activities/events/{eventId}'
    _path = _path.replace('{eventId}', event_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteActivityEvent


    return await _call('get', _path, _headers, _params, model_script)

