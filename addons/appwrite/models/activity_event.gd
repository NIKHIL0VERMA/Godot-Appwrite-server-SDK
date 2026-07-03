class_name AppwriteActivityEvent
extends RefCounted
## ActivityEvent[br]


const _FIELD_MAP := {
    "id": "$id",
    "actortype": "actorType",
    "actorid": "actorId",
    "actoremail": "actorEmail",
    "actorname": "actorName",
    "resourceparent": "resourceParent",
    "resourcetype": "resourceType",
    "resourceid": "resourceId",
    "resource": "resource",
    "event": "event",
    "useragent": "userAgent",
    "ip": "ip",
    "mode": "mode",
    "country": "country",
    "time": "time",
    "projectid": "projectId",
    "teamid": "teamId",
    "hostname": "hostname",
    "countrycode": "countryCode",
    "countryname": "countryName",
}

var id: String ## Event ID.
var actortype: String ## Actor type.
var actorid: String ## Actor ID.
var actoremail: String ## Actor Email.
var actorname: String ## Actor Name.
var resourceparent: String ## Resource parent.
var resourcetype: String ## Resource type.
var resourceid: String ## Resource ID.
var resource: String ## Resource.
var event: String ## Event name.
var useragent: String ## User agent.
var ip: String ## IP address.
var mode: String ## API mode when event triggered.
var country: String ## Location.
var time: String ## Log creation date in ISO 8601 format.
var projectid: String ## Project ID.
var teamid: String ## Team ID.
var hostname: String ## Hostname.
var countrycode: String ## Country two-character ISO 3166-1 alpha code.
var countryname: String ## Country name.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteActivityEvent.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if value != null:
            m.set(key, value)
    return m

## Convert to Dictionary
func to_dict() -> Dictionary:
    var dict := {}

    for key in _FIELD_MAP:
        var value = get(key)

        dict[_FIELD_MAP[key]] = value
    return dict