class_name AppwriteBucket
extends RefCounted
## Bucket[br]


const _FIELD_MAP := {
    "id": "$id",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "filesecurity": "fileSecurity",
    "xname": "name",
    "enabled": "enabled",
    "maximumfilesize": "maximumFileSize",
    "allowedfileextensions": "allowedFileExtensions",
    "compression": "compression",
    "encryption": "encryption",
    "antivirus": "antivirus",
    "transformations": "transformations",
    "totalsize": "totalSize",
}

var id: String ## Bucket ID.
var createdat: String ## Bucket creation time in ISO 8601 format.
var updatedat: String ## Bucket update date in ISO 8601 format.
var permissions: Array ## Bucket permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
var filesecurity: bool ## Whether file-level security is enabled. [Learn more about permissions](https://appwrite.io/docs/permissions).
var xname: String ## Bucket name.
var enabled: bool ## Bucket enabled.
var maximumfilesize: int ## Maximum file size supported.
var allowedfileextensions: Array ## Allowed file extensions.
var compression: String ## Compression algorithm chosen for compression. Will be one of none, [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd).
var encryption: bool ## Bucket is encrypted.
var antivirus: bool ## Virus scanning is enabled.
var transformations: bool ## Image transformations are enabled.
var totalsize: int ## Total size of this bucket in bytes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteBucket.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
            m.set(key, value)
            continue
        if key == "allowedfileextensions" and value is Array:
            m.set(key, value)
            continue
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