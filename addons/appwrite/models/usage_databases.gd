class_name AppwriteUsageDatabases
extends RefCounted
## UsageDatabases[br]


const _FIELD_MAP := {
    "xrange": "range",
    "databasestotal": "databasesTotal",
    "collectionstotal": "collectionsTotal",
    "tablestotal": "tablesTotal",
    "documentstotal": "documentsTotal",
    "rowstotal": "rowsTotal",
    "storagetotal": "storageTotal",
    "databasesreadstotal": "databasesReadsTotal",
    "databaseswritestotal": "databasesWritesTotal",
    "databases": "databases",
    "collections": "collections",
    "tables": "tables",
    "documents": "documents",
    "rows": "rows",
    "storage": "storage",
    "databasesreads": "databasesReads",
    "databaseswrites": "databasesWrites",
}

var xrange: String ## Time range of the usage stats.
var databasestotal: int ## Total aggregated number of databases.
var collectionstotal: int ## Total aggregated number  of collections.
var tablestotal: int ## Total aggregated number  of tables.
var documentstotal: int ## Total aggregated number of documents.
var rowstotal: int ## Total aggregated number of rows.
var storagetotal: int ## Total aggregated number of total databases storage in bytes.
var databasesreadstotal: int ## Total number of databases reads.
var databaseswritestotal: int ## Total number of databases writes.
var databases: Array ## Aggregated number of databases per period.
var collections: Array ## Aggregated number of collections per period.
var tables: Array ## Aggregated number of tables per period.
var documents: Array ## Aggregated number of documents per period.
var rows: Array ## Aggregated number of rows per period.
var storage: Array ## An array of the aggregated number of databases storage in bytes per period.
var databasesreads: Array ## An array of aggregated number of database reads.
var databaseswrites: Array ## An array of aggregated number of database writes.

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteUsageDatabases.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "databases" and value is Array:
            m.set(key, value)
            continue
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
        if key == "databasesreads" and value is Array:
            m.set(key, value)
            continue
        if key == "databaseswrites" and value is Array:
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