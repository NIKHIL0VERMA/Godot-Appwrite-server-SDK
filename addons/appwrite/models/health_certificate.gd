class_name AppwriteHealthCertificate
extends RefCounted
## Health Certificate[br]


const _FIELD_MAP := {
    "xname": "name",
    "subjectsn": "subjectSN",
    "issuerorganisation": "issuerOrganisation",
    "validfrom": "validFrom",
    "validto": "validTo",
    "signaturetypesn": "signatureTypeSN",
}

var xname: String ## Certificate name
var subjectsn: String ## Subject SN
var issuerorganisation: String ## Issuer organisation
var validfrom: String ## Valid from
var validto: String ## Valid to
var signaturetypesn: String ## Signature type SN

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteHealthCertificate.new()

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