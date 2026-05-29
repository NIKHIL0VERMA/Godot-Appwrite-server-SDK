class_name AppwriteAlgoArgon2
extends RefCounted
## AlgoArgon2[br]


const _FIELD_MAP := {
    "xtype": "type",
    "memorycost": "memoryCost",
    "timecost": "timeCost",
    "threads": "threads",
}

var xtype: String ## Algo type.
var memorycost: int ## Memory used to compute hash.
var timecost: int ## Amount of time consumed to compute hash
var threads: int ## Number of threads used to compute hash.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAlgoArgon2.new()

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