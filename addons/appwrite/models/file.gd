class_name AppwriteFile
extends RefCounted
## File[br]


const _FIELD_MAP := {
    "id": "$id",
    "bucketid": "bucketId",
    "createdat": "$createdAt",
    "updatedat": "$updatedAt",
    "permissions": "$permissions",
    "xname": "name",
    "signature": "signature",
    "mimetype": "mimeType",
    "sizeoriginal": "sizeOriginal",
    "sizeactual": "sizeActual",
    "chunkstotal": "chunksTotal",
    "chunksuploaded": "chunksUploaded",
    "encryption": "encryption",
    "compression": "compression",
}

var id: String ## File ID.
var bucketid: String ## Bucket ID.
var createdat: String ## File creation date in ISO 8601 format.
var updatedat: String ## File update date in ISO 8601 format.
var permissions: Array ## File permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
var xname: String ## File name.
var signature: String ## File MD5 signature.
var mimetype: String ## File mime type.
var sizeoriginal: int ## File original size in bytes.
var sizeactual: int ## File actual stored size in bytes after compression and/or encryption.
var chunkstotal: int ## Total number of chunks available
var chunksuploaded: int ## Total number of chunks uploaded
var encryption: bool ## Whether file contents are encrypted at rest.
var compression: String ## Compression algorithm used for the file. Will be one of none, [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd).

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteFile.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "permissions" and value is Array:
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