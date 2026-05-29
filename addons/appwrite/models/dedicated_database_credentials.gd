class_name AppwriteDedicatedDatabaseCredentials
extends RefCounted
## Credentials[br]


const _FIELD_MAP := {
    "id": "$id",
    "host": "host",
    "port": "port",
    "username": "username",
    "password": "password",
    "database": "database",
    "engine": "engine",
    "ssl": "ssl",
    "connectionstring": "connectionString",
}

var id: String ## Database ID.
var host: String ## Database hostname.
var port: int ## Database port.
var username: String ## Database username.
var password: String ## Database password.
var database: String ## Database name.
var engine: String ## Database engine. Possible values: postgres, mysql, mariadb, mongodb.
var ssl: bool ## Whether SSL is required.
var connectionstring: String ## Full connection string.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteDedicatedDatabaseCredentials.new()

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