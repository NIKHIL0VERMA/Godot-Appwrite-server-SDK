extends "../utils/service.gd"
## The Databases service allows you to create structured collections of documents, query and filter lists of documents


## Get a list of all databases from the current Appwrite project. You can use the search parameter to filter your results.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list] instead.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteDatabaseList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteDatabaseList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new Database.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Database name. Max length: 128 chars.[br]
## - [param enabled] [bool]: Is the database enabled? When set to &#039;disabled&#039;, users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.[br]
##[br]
## Returns:[br]
## - [AppwriteDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(database_id: String, xname: String, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases'

    var _params := {}
    _params['databaseId'] = database_id
    _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDatabase

    return await _call('post', _path, _headers, _params, model_script)


## List transactions across all databases.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries).[br]
##[br]
## Returns:[br]
## - [AppwriteTransactionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_transactions(queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/transactions'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteTransactionList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new transaction.[br]
##[br]
## Parameters:[br]
## - [param ttl] [int]: Seconds before the transaction expires.[br]
##[br]
## Returns:[br]
## - [AppwriteTransaction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_transaction(ttl: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if ttl != null and not ttl is int:
        return AppwriteException.new("Invalid type for parameter 'ttl'. Expected int.", 0, "argument_error", "")

    var _path := '/databases/transactions'

    var _params := {}
    if ttl != null:
        _params['ttl'] = ttl

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTransaction

    return await _call('post', _path, _headers, _params, model_script)


## Get a transaction by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param transaction_id] [String]: Transaction ID.[br]
##[br]
## Returns:[br]
## - [AppwriteTransaction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_transaction(transaction_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/transactions/{transactionId}'
    _path = _path.replace('{transactionId}', str(transaction_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteTransaction

    return await _call('get', _path, _headers, _params, model_script)


## Update a transaction, to either commit or roll back its operations.[br]
##[br]
## Parameters:[br]
## - [param transaction_id] [String]: Transaction ID.[br]
## - [param commit] [bool]: Commit transaction?[br]
## - [param rollback] [bool]: Rollback transaction?[br]
##[br]
## Returns:[br]
## - [AppwriteTransaction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_transaction(transaction_id: String, commit: Variant = null, rollback: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if commit != null and not commit is bool:
        return AppwriteException.new("Invalid type for parameter 'commit'. Expected bool.", 0, "argument_error", "")
    if rollback != null and not rollback is bool:
        return AppwriteException.new("Invalid type for parameter 'rollback'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/transactions/{transactionId}'
    _path = _path.replace('{transactionId}', str(transaction_id))

    var _params := {}
    if commit != null:
        _params['commit'] = commit
    if rollback != null:
        _params['rollback'] = rollback

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTransaction

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a transaction by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param transaction_id] [String]: Transaction ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_transaction(transaction_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/transactions/{transactionId}'
    _path = _path.replace('{transactionId}', str(transaction_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Create multiple operations in a single transaction.[br]
##[br]
## Parameters:[br]
## - [param transaction_id] [String]: Transaction ID.[br]
## - [param operations] [Array]: Array of staged operations.[br]
##[br]
## Returns:[br]
## - [AppwriteTransaction] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_operations(transaction_id: String, operations: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if operations != null and not operations is Array:
        return AppwriteException.new("Invalid type for parameter 'operations'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/transactions/{transactionId}/operations'
    _path = _path.replace('{transactionId}', str(transaction_id))

    var _params := {}
    if operations != null:
        _params['operations'] = operations

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteTransaction

    return await _call('post', _path, _headers, _params, model_script)


## List usage metrics and statistics for all databases in the project. You can view the total number of databases, collections, documents, and storage usage. The response includes both current totals and historical data over time. Use the optional range parameter to specify the time window for historical data: 24h (last 24 hours), 30d (last 30 days), or 90d (last 90 days). If not specified, range defaults to 30 days.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_usage] instead.[br]
##[br]
## Parameters:[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageDatabases] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_usage(xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/usage'

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsageDatabases

    return await _call('get', _path, _headers, _params, model_script)


## Get a database by its unique ID. This endpoint response returns a JSON object with the database metadata.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_get] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [AppwriteDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteDatabase

    return await _call('get', _path, _headers, _params, model_script)


## Update a database by its unique ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param xname] [String]: Database name. Max length: 128 chars.[br]
## - [param enabled] [bool]: Is database enabled? When set to &#039;disabled&#039;, users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.[br]
##[br]
## Returns:[br]
## - [AppwriteDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update(database_id: String, xname: Variant = null, enabled: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDatabase

    return await _call('put', _path, _headers, _params, model_script)


## Delete a database by its unique ID. Only API keys with with databases.write scope can delete a database.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_delete] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(database_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all collections that belong to the provided databaseId. You can use the search parameter to filter your results.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_tables] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, enabled, documentSecurity[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteCollectionList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_collections(database_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteCollectionList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new Collection. Before using this route, you should create a new database resource using either a [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection) API or directly from your database console.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_table] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Collection name. Max length: 128 chars.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, no user is granted with any permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param document_security] [bool]: Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param enabled] [bool]: Is collection enabled? When set to &#039;disabled&#039;, users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.[br]
## - [param attributes] [Array]: Array of attribute definitions to create. Each attribute should contain: key (string), type (string: string, integer, float, boolean, datetime), size (integer, required for string type), required (boolean, optional), default (mixed, optional), array (boolean, optional), and type-specific options.[br]
## - [param indexes] [Array]: Array of index definitions to create. Each index should contain: key (string), type (string: key, fulltext, unique, spatial), attributes (array of attribute keys), orders (array of ASC/DESC, optional), and lengths (array of integers, optional).[br]
##[br]
## Returns:[br]
## - [AppwriteCollection] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_collection(database_id: String, collection_id: String, xname: String, permissions: Variant = null, document_security: Variant = null, enabled: Variant = null, attributes: Variant = null, indexes: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if document_security != null and not document_security is bool:
        return AppwriteException.new("Invalid type for parameter 'document_security'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if attributes != null and not attributes is Array:
        return AppwriteException.new("Invalid type for parameter 'attributes'. Expected Array.", 0, "argument_error", "")
    if indexes != null and not indexes is Array:
        return AppwriteException.new("Invalid type for parameter 'indexes'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    _params['collectionId'] = collection_id
    _params['name'] = xname
    if permissions != null:
        _params['permissions'] = permissions
    if document_security != null:
        _params['documentSecurity'] = document_security
    if enabled != null:
        _params['enabled'] = enabled
    if attributes != null:
        _params['attributes'] = attributes
    if indexes != null:
        _params['indexes'] = indexes

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteCollection

    return await _call('post', _path, _headers, _params, model_script)


## Get a collection by its unique ID. This endpoint response returns a JSON object with the collection metadata.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_get_table] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
##[br]
## Returns:[br]
## - [AppwriteCollection] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_collection(database_id: String, collection_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}/collections/{collectionId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteCollection

    return await _call('get', _path, _headers, _params, model_script)


## Update a collection by its unique ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_table] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param xname] [String]: Collection name. Max length: 128 chars.[br]
## - [param permissions] [Array]: An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param document_security] [bool]: Enables configuring permissions for individual documents. A user needs one of document or collection level permissions to access a document. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param enabled] [bool]: Is collection enabled? When set to &#039;disabled&#039;, users cannot access the collection but Server SDKs with and API key can still read and write to the collection. No data is lost when this is toggled.[br]
## - [param purge] [bool]: When true, purge all cached list responses for this collection as part of the update. Use this to force readers to see fresh data immediately instead of waiting for the cache TTL to expire.[br]
##[br]
## Returns:[br]
## - [AppwriteCollection] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_collection(database_id: String, collection_id: String, xname: Variant = null, permissions: Variant = null, document_security: Variant = null, enabled: Variant = null, purge: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if document_security != null and not document_security is bool:
        return AppwriteException.new("Invalid type for parameter 'document_security'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if purge != null and not purge is bool:
        return AppwriteException.new("Invalid type for parameter 'purge'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if permissions != null:
        _params['permissions'] = permissions
    if document_security != null:
        _params['documentSecurity'] = document_security
    if enabled != null:
        _params['enabled'] = enabled
    if purge != null:
        _params['purge'] = purge

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteCollection

    return await _call('put', _path, _headers, _params, model_script)


## Delete a collection by its unique ID. Only users with write permissions have access to delete this resource.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_delete_table] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_collection(database_id: String, collection_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}/collections/{collectionId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## List attributes in the collection.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_columns] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, type, size, required, array, status, error[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_attributes(database_id: String, collection_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteAttributeList

    return await _call('get', _path, _headers, _params, model_script)


## Create a bigint attribute. Optionally, minimum and maximum values can be provided.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_big_int_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param default] [int]: Default value. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeBigint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_big_int_attribute(database_id: String, collection_id: String, key: String, required: bool, min: Variant = null, max: Variant = null, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if default != null and not default is int:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected int.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/bigint'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeBigint

    return await _call('post', _path, _headers, _params, model_script)


## Update a bigint attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_big_int_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [int]: Default value. Cannot be set when attribute is required.[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeBigint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_big_int_attribute(database_id: String, collection_id: String, key: String, required: bool, default: int, min: Variant = null, max: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/bigint/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeBigint

    return await _call('patch', _path, _headers, _params, model_script)


## Create a boolean attribute.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_boolean_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [bool]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeBoolean] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_boolean_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is bool:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected bool.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/boolean'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeBoolean

    return await _call('post', _path, _headers, _params, model_script)


## Update a boolean attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_boolean_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [bool]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New attribute key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeBoolean] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_boolean_attribute(database_id: String, collection_id: String, key: String, required: bool, default: bool, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/boolean/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeBoolean

    return await _call('patch', _path, _headers, _params, model_script)


## Create a date time attribute according to the ISO 8601 standard.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_datetime_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for the attribute in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeDatetime] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_datetime_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/datetime'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeDatetime

    return await _call('post', _path, _headers, _params, model_script)


## Update a date time attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_datetime_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New attribute key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeDatetime] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_datetime_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/datetime/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeDatetime

    return await _call('patch', _path, _headers, _params, model_script)


## Create an email attribute.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_email_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeEmail] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_email_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/email'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeEmail

    return await _call('post', _path, _headers, _params, model_script)


## Update an email attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_email_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeEmail] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/email/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeEmail

    return await _call('patch', _path, _headers, _params, model_script)


## Create an enum attribute. The `elements` param acts as a white-list of accepted values for this attribute. [br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_enum_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param elements] [Array]: Array of enum values.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeEnum] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_enum_attribute(database_id: String, collection_id: String, key: String, elements: Array, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/enum'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['elements'] = elements
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeEnum

    return await _call('post', _path, _headers, _params, model_script)


## Update an enum attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_enum_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param elements] [Array]: Updated list of enum values.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeEnum] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_enum_attribute(database_id: String, collection_id: String, key: String, elements: Array, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/enum/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['elements'] = elements
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeEnum

    return await _call('patch', _path, _headers, _params, model_script)


## Create a float attribute. Optionally, minimum and maximum values can be provided.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_float_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param min] [float]: Minimum value.[br]
## - [param max] [float]: Maximum value.[br]
## - [param default] [float]: Default value. Cannot be set when required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeFloat] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_float_attribute(database_id: String, collection_id: String, key: String, required: bool, min: Variant = null, max: Variant = null, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is float and not typeof(min) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected float.", 0, "argument_error", "")
    if max != null and not max is float and not typeof(max) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected float.", 0, "argument_error", "")
    if default != null and not default is float and not typeof(default) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected float.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/float'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeFloat

    return await _call('post', _path, _headers, _params, model_script)


## Update a float attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_float_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [float]: Default value. Cannot be set when required.[br]
## - [param min] [float]: Minimum value.[br]
## - [param max] [float]: Maximum value.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeFloat] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_float_attribute(database_id: String, collection_id: String, key: String, required: bool, default: float, min: Variant = null, max: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is float and not typeof(min) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected float.", 0, "argument_error", "")
    if max != null and not max is float and not typeof(max) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected float.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/float/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeFloat

    return await _call('patch', _path, _headers, _params, model_script)


## Create an integer attribute. Optionally, minimum and maximum values can be provided.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_integer_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param default] [int]: Default value. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeInteger] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_integer_attribute(database_id: String, collection_id: String, key: String, required: bool, min: Variant = null, max: Variant = null, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if default != null and not default is int:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected int.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/integer'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeInteger

    return await _call('post', _path, _headers, _params, model_script)


## Update an integer attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_integer_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [int]: Default value. Cannot be set when attribute is required.[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeInteger] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_integer_attribute(database_id: String, collection_id: String, key: String, required: bool, default: int, min: Variant = null, max: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/integer/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    if min != null:
        _params['min'] = min
    if max != null:
        _params['max'] = max
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeInteger

    return await _call('patch', _path, _headers, _params, model_script)


## Create IP address attribute.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_ip_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeIp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_ip_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/ip'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeIp

    return await _call('post', _path, _headers, _params, model_script)


## Update an ip attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_ip_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeIp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_ip_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/ip/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeIp

    return await _call('patch', _path, _headers, _params, model_script)


## Create a geometric line attribute.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_line_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [Array]: Default value for attribute when not provided, two-dimensional array of coordinate pairs, [[longitude, latitude], [longitude, latitude], …], listing the vertices of the line in order. Cannot be set when attribute is required.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeLine] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_line_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/line'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeLine

    return await _call('post', _path, _headers, _params, model_script)


## Update a line attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_line_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [Array]: Default value for attribute when not provided, two-dimensional array of coordinate pairs, [[longitude, latitude], [longitude, latitude], …], listing the vertices of the line in order. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New attribute key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeLine] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_line_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/line/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeLine

    return await _call('patch', _path, _headers, _params, model_script)


## Create a longtext attribute.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the attribute. Encryption enhances security by not storing any plain text values in the database. However, encrypted attributes cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeLongtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_longtext_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/longtext'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array
    if encrypt != null:
        _params['encrypt'] = encrypt

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeLongtext

    return await _call('post', _path, _headers, _params, model_script)


## Update a longtext attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeLongtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_longtext_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/longtext/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeLongtext

    return await _call('patch', _path, _headers, _params, model_script)


## Create a mediumtext attribute.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the attribute. Encryption enhances security by not storing any plain text values in the database. However, encrypted attributes cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeMediumtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mediumtext_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/mediumtext'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array
    if encrypt != null:
        _params['encrypt'] = encrypt

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeMediumtext

    return await _call('post', _path, _headers, _params, model_script)


## Update a mediumtext attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeMediumtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mediumtext_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/mediumtext/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeMediumtext

    return await _call('patch', _path, _headers, _params, model_script)


## Create a geometric point attribute.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_point_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [Array]: Default value for attribute when not provided, array of two numbers [longitude, latitude], representing a single coordinate. Cannot be set when attribute is required.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributePoint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_point_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/point'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributePoint

    return await _call('post', _path, _headers, _params, model_script)


## Update a point attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_point_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [Array]: Default value for attribute when not provided, array of two numbers [longitude, latitude], representing a single coordinate. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New attribute key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributePoint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_point_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/point/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributePoint

    return await _call('patch', _path, _headers, _params, model_script)


## Create a geometric polygon attribute.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_polygon_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [Array]: Default value for attribute when not provided, three-dimensional array where the outer array holds one or more linear rings, [[[longitude, latitude], …], …], the first ring is the exterior boundary, any additional rings are interior holes, and each ring must start and end with the same coordinate pair. Cannot be set when attribute is required.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributePolygon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_polygon_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/polygon'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributePolygon

    return await _call('post', _path, _headers, _params, model_script)


## Update a polygon attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_polygon_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#createCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [Array]: Default value for attribute when not provided, three-dimensional array where the outer array holds one or more linear rings, [[[longitude, latitude], …], …], the first ring is the exterior boundary, any additional rings are interior holes, and each ring must start and end with the same coordinate pair. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New attribute key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributePolygon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_polygon_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/polygon/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributePolygon

    return await _call('patch', _path, _headers, _params, model_script)


## Create relationship attribute. [Learn more about relationship attributes](https://appwrite.io/docs/databases-relationships#relationship-attributes).[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_relationship_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param related_collection_id] [String]: Related Collection ID.[br]
## - [param xtype] [String]: Relation type[br]
## - [param two_way] [bool]: Is Two Way?[br]
## - [param key] [String]: Attribute Key.[br]
## - [param two_way_key] [String]: Two Way Attribute Key.[br]
## - [param on_delete] [String]: Constraints option[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeRelationship] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_relationship_attribute(database_id: String, collection_id: String, related_collection_id: String, xtype: String, two_way: Variant = null, key: Variant = null, two_way_key: Variant = null, on_delete: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if two_way != null and not two_way is bool:
        return AppwriteException.new("Invalid type for parameter 'two_way'. Expected bool.", 0, "argument_error", "")
    if key != null and not key is String:
        return AppwriteException.new("Invalid type for parameter 'key'. Expected String.", 0, "argument_error", "")
    if two_way_key != null and not two_way_key is String:
        return AppwriteException.new("Invalid type for parameter 'two_way_key'. Expected String.", 0, "argument_error", "")
    if on_delete != null and not on_delete is String:
        return AppwriteException.new("Invalid type for parameter 'on_delete'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/relationship'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['relatedCollectionId'] = related_collection_id
    _params['type'] = xtype
    if two_way != null:
        _params['twoWay'] = two_way
    if key != null:
        _params['key'] = key
    if two_way_key != null:
        _params['twoWayKey'] = two_way_key
    if on_delete != null:
        _params['onDelete'] = on_delete

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeRelationship

    return await _call('post', _path, _headers, _params, model_script)


## Update relationship attribute. [Learn more about relationship attributes](https://appwrite.io/docs/databases-relationships#relationship-attributes).[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_relationship_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param on_delete] [String]: Constraints option[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeRelationship] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_relationship_attribute(database_id: String, collection_id: String, key: String, on_delete: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if on_delete != null and not on_delete is String:
        return AppwriteException.new("Invalid type for parameter 'on_delete'. Expected String.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/relationship/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    if on_delete != null:
        _params['onDelete'] = on_delete
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeRelationship

    return await _call('patch', _path, _headers, _params, model_script)


## Create a string attribute.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_string_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param size] [int]: Attribute size for text attributes, in number of characters.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the attribute. Encryption enhances security by not storing any plain text values in the database. However, encrypted attributes cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeString] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_string_attribute(database_id: String, collection_id: String, key: String, size: int, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/string'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['size'] = size
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array
    if encrypt != null:
        _params['encrypt'] = encrypt

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeString

    return await _call('post', _path, _headers, _params, model_script)


## Update a string attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_string_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param size] [int]: Maximum size of the string attribute.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeString] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_string_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, size: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if size != null and not size is int:
        return AppwriteException.new("Invalid type for parameter 'size'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/string/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if size != null:
        _params['size'] = size
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeString

    return await _call('patch', _path, _headers, _params, model_script)


## Create a text attribute.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the attribute. Encryption enhances security by not storing any plain text values in the database. However, encrypted attributes cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeText] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_text_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/text'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array
    if encrypt != null:
        _params['encrypt'] = encrypt

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeText

    return await _call('post', _path, _headers, _params, model_script)


## Update a text attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeText] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_text_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/text/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeText

    return await _call('patch', _path, _headers, _params, model_script)


## Create a URL attribute.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_url_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeUrl] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_url_attribute(database_id: String, collection_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/url'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeUrl

    return await _call('post', _path, _headers, _params, model_script)


## Update an url attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_url_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeUrl] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_url_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/url/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeUrl

    return await _call('patch', _path, _headers, _params, model_script)


## Create a varchar attribute.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param size] [int]: Attribute size for varchar attributes, in number of characters. Maximum size is 16381.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param array] [bool]: Is attribute an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the attribute. Encryption enhances security by not storing any plain text values in the database. However, encrypted attributes cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeVarchar] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_varchar_attribute(database_id: String, collection_id: String, key: String, size: int, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/varchar'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['size'] = size
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array
    if encrypt != null:
        _params['encrypt'] = encrypt

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeVarchar

    return await _call('post', _path, _headers, _params, model_script)


## Update a varchar attribute. Changing the `default` value will not update already existing documents.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Attribute Key.[br]
## - [param required] [bool]: Is attribute required?[br]
## - [param default] [String]: Default value for attribute when not provided. Cannot be set when attribute is required.[br]
## - [param size] [int]: Maximum size of the varchar attribute.[br]
## - [param new_key] [String]: New Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeVarchar] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_varchar_attribute(database_id: String, collection_id: String, key: String, required: bool, default: String, size: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if size != null and not size is int:
        return AppwriteException.new("Invalid type for parameter 'size'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/varchar/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if size != null:
        _params['size'] = size
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteAttributeVarchar

    return await _call('patch', _path, _headers, _params, model_script)


## Get attribute by ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_get_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
##[br]
## Returns:[br]
## - [AppwriteAttributeBoolean] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_attribute(database_id: String, collection_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteAttributeBoolean

    return await _call('get', _path, _headers, _params, model_script)


## Deletes an attribute.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_delete_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param key] [String]: Attribute Key.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_attribute(database_id: String, collection_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}/collections/{collectionId}/attributes/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all the user&#039;s documents in a given collection. You can use the query params to filter your results.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_rows] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID to read uncommitted changes within the transaction.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
## - [param ttl] [int]: TTL (seconds) for caching list responses. Responses are stored in an in-memory key-value cache, keyed per project, collection, schema version (attributes and indexes), caller authorization roles, and the exact query — so users with different permissions never share cached entries. Schema changes invalidate cached entries automatically; document writes do not, so choose a TTL you are comfortable serving as stale data. Set to 0 to disable caching. Must be between 0 and 86400 (24 hours).[br]
##[br]
## Returns:[br]
## - [AppwriteDocumentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_documents(database_id: String, collection_id: String, queries: Variant = null, transaction_id: Variant = null, total: Variant = null, ttl: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")
    if ttl != null and not ttl is int:
        return AppwriteException.new("Invalid type for parameter 'ttl'. Expected int.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if transaction_id != null:
        _params['transactionId'] = transaction_id
    if total != null:
        _params['total'] = total
    if ttl != null:
        _params['ttl'] = ttl

    var _headers := {
    }

    var model_script = AppwriteDocumentList

    return await _call('get', _path, _headers, _params, model_script)


## Create a new Document. Before using this route, you should create a new collection resource using either a [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection) API or directly from your database console.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_row] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.[br]
## - [param document_id] [String]: Document ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param data] [Dictionary]: Document data as JSON object.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocument] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_document(database_id: String, collection_id: String, document_id: String, data: Dictionary, permissions: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['documentId'] = document_id
    _params['data'] = data
    if permissions != null:
        _params['permissions'] = permissions
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocument

    return await _call('post', _path, _headers, _params, model_script)


## Create new Documents. Before using this route, you should create a new collection resource using either a [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection) API or directly from your database console.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_rows] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection). Make sure to define attributes before creating documents.[br]
## - [param documents] [Array]: Array of documents data as JSON objects.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocumentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_documents(database_id: String, collection_id: String, documents: Array, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['documents'] = documents
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocumentList

    return await _call('post', _path, _headers, _params, model_script)


## Create or update Documents. Before using this route, you should create a new collection resource using either a [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection) API or directly from your database console.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_upsert_rows] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param documents] [Array]: Array of document data as JSON objects. May contain partial documents.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocumentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func upsert_documents(database_id: String, collection_id: String, documents: Array, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['documents'] = documents
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocumentList

    return await _call('put', _path, _headers, _params, model_script)


## Update all documents that match your queries, if no queries are submitted then all documents are updated. You can pass only specific fields to be updated.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_rows] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param data] [Dictionary]: Document data as JSON object. Include only attribute and value pairs to be updated.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocumentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_documents(database_id: String, collection_id: String, data: Variant = null, queries: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if data != null:
        _params['data'] = data
    if queries != null:
        _params['queries'] = queries
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocumentList

    return await _call('patch', _path, _headers, _params, model_script)


## Bulk delete documents using queries, if no queries are passed then all documents are deleted.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_delete_rows] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocumentList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_documents(database_id: String, collection_id: String, queries: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocumentList

    return await _call('delete', _path, _headers, _params, model_script)


## Get a document by its unique ID. This endpoint response returns a JSON object with the document data.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_get_row] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param document_id] [String]: Document ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID to read uncommitted changes within the transaction.[br]
##[br]
## Returns:[br]
## - [AppwriteDocument] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_document(database_id: String, collection_id: String, document_id: String, queries: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{documentId}', str(document_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
    }

    var model_script = AppwriteDocument

    return await _call('get', _path, _headers, _params, model_script)


## Create or update a Document. Before using this route, you should create a new collection resource using either a [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection) API or directly from your database console.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_upsert_row] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param document_id] [String]: Document ID.[br]
## - [param data] [Dictionary]: Document data as JSON object. Include all required attributes of the document to be created or updated.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocument] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func upsert_document(database_id: String, collection_id: String, document_id: String, data: Variant = null, permissions: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{documentId}', str(document_id))

    var _params := {}
    if data != null:
        _params['data'] = data
    if permissions != null:
        _params['permissions'] = permissions
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocument

    return await _call('put', _path, _headers, _params, model_script)


## Update a document by its unique ID. Using the patch method you can pass only specific fields that will get updated.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_row] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param document_id] [String]: Document ID.[br]
## - [param data] [Dictionary]: Document data as JSON object. Include only attribute and value pairs to be updated.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocument] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_document(database_id: String, collection_id: String, document_id: String, data: Variant = null, permissions: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{documentId}', str(document_id))

    var _params := {}
    if data != null:
        _params['data'] = data
    if permissions != null:
        _params['permissions'] = permissions
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocument

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a document by its unique ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_delete_row] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param document_id] [String]: Document ID.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_document(database_id: String, collection_id: String, document_id: String, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{documentId}', str(document_id))

    var _params := {}
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get the document activity logs list by its unique ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_row_logs] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param document_id] [String]: Document ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_document_logs(database_id: String, collection_id: String, document_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/logs'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{documentId}', str(document_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Decrement a specific attribute of a document by a given value.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_decrement_row_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param document_id] [String]: Document ID.[br]
## - [param attribute] [String]: Attribute key.[br]
## - [param value] [float]: Value to increment the attribute by. The value must be a number.[br]
## - [param min] [float]: Minimum value for the attribute. If the current value is lesser than this value, an exception will be thrown.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocument] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func decrement_document_attribute(database_id: String, collection_id: String, document_id: String, attribute: String, value: Variant = null, min: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if value != null and not value is float and not typeof(value) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected float.", 0, "argument_error", "")
    if min != null and not min is float and not typeof(min) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected float.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/decrement'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{documentId}', str(document_id))
    _path = _path.replace('{attribute}', str(attribute))

    var _params := {}
    if value != null:
        _params['value'] = value
    if min != null:
        _params['min'] = min
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocument

    return await _call('patch', _path, _headers, _params, model_script)


## Increment a specific attribute of a document by a given value.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_increment_row_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param document_id] [String]: Document ID.[br]
## - [param attribute] [String]: Attribute key.[br]
## - [param value] [float]: Value to increment the attribute by. The value must be a number.[br]
## - [param max] [float]: Maximum value for the attribute. If the current value is greater than this value, an error will be thrown.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteDocument] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func increment_document_attribute(database_id: String, collection_id: String, document_id: String, attribute: String, value: Variant = null, max: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if value != null and not value is float and not typeof(value) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected float.", 0, "argument_error", "")
    if max != null and not max is float and not typeof(max) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected float.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/increment'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{documentId}', str(document_id))
    _path = _path.replace('{attribute}', str(attribute))

    var _params := {}
    if value != null:
        _params['value'] = value
    if max != null:
        _params['max'] = max
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteDocument

    return await _call('patch', _path, _headers, _params, model_script)


## List indexes in the collection.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_indexes] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: key, type, status, attributes, error[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteIndexList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_indexes(database_id: String, collection_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/indexes'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteIndexList

    return await _call('get', _path, _headers, _params, model_script)


## Creates an index on the attributes listed. Your index should include all the attributes you will query in a single request.[br]
##Attributes can be `key`, `fulltext`, and `unique`.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_create_index] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Index Key.[br]
## - [param xtype] [String]: Index type.[br]
## - [param attributes] [Array]: Array of attributes to index. Maximum of 100 attributes are allowed, each 32 characters long.[br]
## - [param orders] [Array[String]]: Array of index orders. Maximum of 100 orders are allowed.[br]
## - [param lengths] [Array]: Length of index. Maximum of 100[br]
##[br]
## Returns:[br]
## - [AppwriteIndex] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_index(database_id: String, collection_id: String, key: String, xtype: String, attributes: Array, orders: Variant = null, lengths: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if orders != null and not orders is Array:
        return AppwriteException.new("Invalid type for parameter 'orders'. Expected Array[String].", 0, "argument_error", "")
    if lengths != null and not lengths is Array:
        return AppwriteException.new("Invalid type for parameter 'lengths'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/indexes'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    _params['key'] = key
    _params['type'] = xtype
    _params['attributes'] = attributes
    if orders != null:
        _params['orders'] = orders
    if lengths != null:
        _params['lengths'] = lengths

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteIndex

    return await _call('post', _path, _headers, _params, model_script)


## Get an index by its unique ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_get_index] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Index Key.[br]
##[br]
## Returns:[br]
## - [AppwriteIndex] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_index(database_id: String, collection_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}/collections/{collectionId}/indexes/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteIndex

    return await _call('get', _path, _headers, _params, model_script)


## Delete an index.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_delete_index] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID. You can create a new collection using the Database service [server integration](https://appwrite.io/docs/server/databases#databasesCreateCollection).[br]
## - [param key] [String]: Index Key.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_index(database_id: String, collection_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/databases/{databaseId}/collections/{collectionId}/indexes/{key}'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))
    _path = _path.replace('{key}', str(key))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)


## Get the collection activity logs list by its unique ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_table_logs] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_collection_logs(database_id: String, collection_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/logs'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Get usage metrics and statistics for a collection. Returning the total number of documents. The response includes both current totals and historical data over time. Use the optional range parameter to specify the time window for historical data: 24h (last 24 hours), 30d (last 30 days), or 90d (last 90 days). If not specified, range defaults to 30 days.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_get_table_usage] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param collection_id] [String]: Collection ID.[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageCollection] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_collection_usage(database_id: String, collection_id: String, xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/collections/{collectionId}/usage'
    _path = _path.replace('{databaseId}', str(database_id))
    _path = _path.replace('{collectionId}', str(collection_id))

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsageCollection

    return await _call('get', _path, _headers, _params, model_script)


## Get the database activity logs list by its unique ID.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_list_database_logs] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Only supported methods are limit and offset[br]
##[br]
## Returns:[br]
## - [AppwriteLogList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_logs(database_id: String, queries: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/logs'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
    }

    var model_script = AppwriteLogList

    return await _call('get', _path, _headers, _params, model_script)


## Get usage metrics and statistics for a database. You can view the total number of collections, documents, and storage usage. The response includes both current totals and historical data over time. Use the optional range parameter to specify the time window for historical data: 24h (last 24 hours), 30d (last 30 days), or 90d (last 90 days). If not specified, range defaults to 30 days.[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_get_usage] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param xrange] [String]: Date range.[br]
##[br]
## Returns:[br]
## - [AppwriteUsageDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_usage(database_id: String, xrange: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xrange != null and not xrange is String:
        return AppwriteException.new("Invalid type for parameter 'xrange'. Expected String.", 0, "argument_error", "")

    var _path := '/databases/{databaseId}/usage'
    _path = _path.replace('{databaseId}', str(database_id))

    var _params := {}
    if xrange != null:
        _params['range'] = xrange

    var _headers := {
    }

    var model_script = AppwriteUsageDatabase

    return await _call('get', _path, _headers, _params, model_script)

