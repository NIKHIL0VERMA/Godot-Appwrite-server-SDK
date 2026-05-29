class_name AppwriteLog
extends RefCounted
## Log[br]


const _FIELD_MAP := {
    "event": "event",
    "userid": "userId",
    "useremail": "userEmail",
    "username": "userName",
    "mode": "mode",
    "usertype": "userType",
    "ip": "ip",
    "time": "time",
    "oscode": "osCode",
    "osname": "osName",
    "osversion": "osVersion",
    "clienttype": "clientType",
    "clientcode": "clientCode",
    "clientname": "clientName",
    "clientversion": "clientVersion",
    "clientengine": "clientEngine",
    "clientengineversion": "clientEngineVersion",
    "devicename": "deviceName",
    "devicebrand": "deviceBrand",
    "devicemodel": "deviceModel",
    "countrycode": "countryCode",
    "countryname": "countryName",
}

var event: String ## Event name.
var userid: String ## User ID of the actor recorded for this log. During impersonation, this is the original impersonator, not the impersonated target user.
var useremail: String ## User email of the actor recorded for this log. During impersonation, this is the original impersonator.
var username: String ## User name of the actor recorded for this log. During impersonation, this is the original impersonator.
var mode: String ## API mode when event triggered.
var usertype: String ## User type who triggered the audit log. Possible values: user, admin, guest, keyProject, keyAccount, keyOrganization.
var ip: String ## IP session in use when the session was created.
var time: String ## Log creation date in ISO 8601 format.
var oscode: String ## Operating system code name. View list of [available options](https://github.com/appwrite/appwrite/blob/master/docs/lists/os.json).
var osname: String ## Operating system name.
var osversion: String ## Operating system version.
var clienttype: String ## Client type.
var clientcode: String ## Client code name. View list of [available options](https://github.com/appwrite/appwrite/blob/master/docs/lists/clients.json).
var clientname: String ## Client name.
var clientversion: String ## Client version.
var clientengine: String ## Client engine name.
var clientengineversion: String ## Client engine name.
var devicename: String ## Device name.
var devicebrand: String ## Device brand name.
var devicemodel: String ## Device model name.
var countrycode: String ## Country two-character ISO 3166-1 alpha code.
var countryname: String ## Country name.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteLog.new()

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