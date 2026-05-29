class_name AppwriteCurrency
extends RefCounted
## Currency[br]


const _FIELD_MAP := {
    "symbol": "symbol",
    "xname": "name",
    "symbolnative": "symbolNative",
    "decimaldigits": "decimalDigits",
    "rounding": "rounding",
    "code": "code",
    "nameplural": "namePlural",
}

var symbol: String ## Currency symbol.
var xname: String ## Currency name.
var symbolnative: String ## Currency native symbol.
var decimaldigits: int ## Number of decimal digits.
var rounding: float ## Currency digit rounding.
var code: String ## Currency code in [ISO 4217-1](http://en.wikipedia.org/wiki/ISO_4217) three-character format.
var nameplural: String ## Currency plural name

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteCurrency.new()

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