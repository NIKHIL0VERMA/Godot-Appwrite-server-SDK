class_name AppwriteSpecification
extends RefCounted
## Specification[br]


const _FIELD_MAP := {
    "memory": "memory",
    "cpus": "cpus",
    "enabled": "enabled",
    "slug": "slug",
}

var memory: int ## Memory size in MB.
var cpus: float ## Number of CPUs.
var enabled: bool ## Is size enabled.
var slug: String ## Size slug.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteSpecification.new()

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