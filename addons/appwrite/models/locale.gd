class_name AppwriteLocale
extends RefCounted
## Locale[br]


const _FIELD_MAP := {
    "ip": "ip",
    "countrycode": "countryCode",
    "country": "country",
    "continentcode": "continentCode",
    "continent": "continent",
    "eu": "eu",
    "currency": "currency",
}

var ip: String ## User IP address.
var countrycode: String ## Country code in [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1) two-character format
var country: String ## Country name. This field support localization.
var continentcode: String ## Continent code. A two character continent code &quot;AF&quot; for Africa, &quot;AN&quot; for Antarctica, &quot;AS&quot; for Asia, &quot;EU&quot; for Europe, &quot;NA&quot; for North America, &quot;OC&quot; for Oceania, and &quot;SA&quot; for South America.
var continent: String ## Continent name. This field support localization.
var eu: bool ## True if country is part of the European Union.
var currency: String ## Currency code in [ISO 4217-1](http://en.wikipedia.org/wiki/ISO_4217) three-character format

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteLocale.new()

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