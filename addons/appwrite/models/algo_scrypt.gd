class_name AppwriteAlgoScrypt
extends RefCounted
## AlgoScrypt[br]


const _FIELD_MAP := {
    "xtype": "type",
    "costcpu": "costCpu",
    "costmemory": "costMemory",
    "costparallel": "costParallel",
    "length": "length",
}

var xtype: String ## Algo type.
var costcpu: int ## CPU complexity of computed hash.
var costmemory: int ## Memory complexity of computed hash.
var costparallel: int ## Parallelization of computed hash.
var length: int ## Length used to compute hash.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteAlgoScrypt.new()

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