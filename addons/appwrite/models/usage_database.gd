class_name AppwriteUsageDatabase
extends RefCounted
## UsageDatabase[br]


const _FIELD_MAP := {
    "xrange": "range",
    "collectionstotal": "collectionsTotal",
    "tablestotal": "tablesTotal",
    "documentstotal": "documentsTotal",
    "rowstotal": "rowsTotal",
    "storagetotal": "storageTotal",
    "databasereadstotal": "databaseReadsTotal",
    "databasewritestotal": "databaseWritesTotal",
    "collections": "collections",
    "tables": "tables",
    "documents": "documents",
    "rows": "rows",
    "storage": "storage",
    "databasereads": "databaseReads",
    "databasewrites": "databaseWrites",
}

var xrange: String ## Time range of the usage stats.
var collectionstotal: int ## Total aggregated number of collections.
var tablestotal: int ## Total aggregated number of tables.
var documentstotal: int ## Total aggregated number of documents.
var rowstotal: int ## Total aggregated number of rows.
var storagetotal: int ## Total aggregated number of total storage used in bytes.
var databasereadstotal: int ## Total number of databases reads.
var databasewritestotal: int ## Total number of databases writes.
var collections: Array ## Aggregated  number of collections per period.
var tables: Array ## Aggregated  number of tables per period.
var documents: Array ## Aggregated  number of documents per period.
var rows: Array ## Aggregated  number of rows per period.
var storage: Array ## Aggregated storage used in bytes per period.
var databasereads: Array ## An array of aggregated number of database reads.
var databasewrites: Array ## An array of aggregated number of database writes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageDatabase.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "collections" and value is Array:
            m.set(key, value)
            continue
        if key == "tables" and value is Array:
            m.set(key, value)
            continue
        if key == "documents" and value is Array:
            m.set(key, value)
            continue
        if key == "rows" and value is Array:
            m.set(key, value)
            continue
        if key == "storage" and value is Array:
            m.set(key, value)
            continue
        if key == "databasereads" and value is Array:
            m.set(key, value)
            continue
        if key == "databasewrites" and value is Array:
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