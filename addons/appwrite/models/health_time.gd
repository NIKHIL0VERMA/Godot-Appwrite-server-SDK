class_name AppwriteHealthTime
extends RefCounted
## Health Time[br]


const _FIELD_MAP := {
    "remotetime": "remoteTime",
    "localtime": "localTime",
    "diff": "diff",
}

var remotetime: int ## Current unix timestamp on trustful remote server.
var localtime: int ## Current unix timestamp of local server where Appwrite runs.
var diff: int ## Difference of unix remote and local timestamps in milliseconds.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteHealthTime.new()

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