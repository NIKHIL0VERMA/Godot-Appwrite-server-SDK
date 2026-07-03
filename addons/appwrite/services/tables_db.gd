extends "../utils/service.gd"
## Service class.


## Get a list of all databases from the current Appwrite project. You can use the search parameter to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: name[br]
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

    var _path := '/tablesdb'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteDatabaseList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new Database.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Database name. Max length: 128 chars.[br]
## - [param enabled] [bool]: Is the database enabled? When set to &#039;disabled&#039;, users cannot access the database but Server SDKs with an API key can still read and write to the database. No data is lost when this is toggled.[br]
## - [param dedicated_database_id] [String]: Optional dedicated database (compute) ID to attach this database to. Leave empty to create a database on the shared pool.[br]
##[br]
## Returns:[br]
## - [AppwriteDatabase] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create(database_id: String, xname: String, enabled: Variant = null, dedicated_database_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if dedicated_database_id != null and not dedicated_database_id is String:
        return AppwriteException.new("Invalid type for parameter 'dedicated_database_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb'

    var _params := {}
    _params['databaseId'] = database_id
    _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled
    if dedicated_database_id != null:
        _params['dedicatedDatabaseId'] = dedicated_database_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
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

    var _path := '/tablesdb/transactions'

    var _params := {}
    if queries != null:
        _params['queries'] = queries

    var _headers := {
        'accept': 'application/json',
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

    var _path := '/tablesdb/transactions'

    var _params := {}
    if ttl != null:
        _params['ttl'] = ttl

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
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

    var _path := '/tablesdb/transactions/{transactionId}'
    _path = _path.replace('{transactionId}', transaction_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
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

    var _path := '/tablesdb/transactions/{transactionId}'
    _path = _path.replace('{transactionId}', transaction_id.uri_encode())

    var _params := {}
    if commit != null:
        _params['commit'] = commit
    if rollback != null:
        _params['rollback'] = rollback

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
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

    var _path := '/tablesdb/transactions/{transactionId}'
    _path = _path.replace('{transactionId}', transaction_id.uri_encode())

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

    var _path := '/tablesdb/transactions/{transactionId}/operations'
    _path = _path.replace('{transactionId}', transaction_id.uri_encode())

    var _params := {}
    if operations != null:
        _params['operations'] = operations

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteTransaction


    return await _call('post', _path, _headers, _params, model_script)


## Get a database by its unique ID. This endpoint response returns a JSON object with the database metadata.[br]
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

    var _path := '/tablesdb/{databaseId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteDatabase


    return await _call('get', _path, _headers, _params, model_script)


## Update a database by its unique ID.[br]
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

    var _path := '/tablesdb/{databaseId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if enabled != null:
        _params['enabled'] = enabled

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteDatabase


    return await _call('put', _path, _headers, _params, model_script)


## Delete a database by its unique ID. Only API keys with with databases.write scope can delete a database.[br]
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

    var _path := '/tablesdb/{databaseId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all tables that belong to the provided databaseId. You can use the search parameter to filter your results.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: name, enabled, rowSecurity[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteTableList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_tables(database_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables'
    _path = _path.replace('{databaseId}', database_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteTableList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new Table. Before using this route, you should create a new database resource using either a [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable) API or directly from your database console.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Table name. Max length: 128 chars.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, no user is granted with any permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param row_security] [bool]: Enables configuring permissions for individual rows. A user needs one of row or table level permissions to access a row. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param enabled] [bool]: Is table enabled? When set to &#039;disabled&#039;, users cannot access the table but Server SDKs with and API key can still read and write to the table. No data is lost when this is toggled.[br]
## - [param columns] [Array]: Array of column definitions to create. Each column should contain: key (string), type (string: string, integer, float, boolean, datetime, relationship), size (integer, required for string type), required (boolean, optional), default (mixed, optional), array (boolean, optional), and type-specific options.[br]
## - [param indexes] [Array]: Array of index definitions to create. Each index should contain: key (string), type (string: key, fulltext, unique, spatial), attributes (array of column keys), orders (array of ASC/DESC, optional), and lengths (array of integers, optional).[br]
##[br]
## Returns:[br]
## - [AppwriteTable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_table(database_id: String, table_id: String, xname: String, permissions: Variant = null, row_security: Variant = null, enabled: Variant = null, columns: Variant = null, indexes: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if row_security != null and not row_security is bool:
        return AppwriteException.new("Invalid type for parameter 'row_security'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if columns != null and not columns is Array:
        return AppwriteException.new("Invalid type for parameter 'columns'. Expected Array.", 0, "argument_error", "")
    if indexes != null and not indexes is Array:
        return AppwriteException.new("Invalid type for parameter 'indexes'. Expected Array.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables'
    _path = _path.replace('{databaseId}', database_id.uri_encode())

    var _params := {}
    _params['tableId'] = table_id
    _params['name'] = xname
    if permissions != null:
        _params['permissions'] = permissions
    if row_security != null:
        _params['rowSecurity'] = row_security
    if enabled != null:
        _params['enabled'] = enabled
    if columns != null:
        _params['columns'] = columns
    if indexes != null:
        _params['indexes'] = indexes

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteTable


    return await _call('post', _path, _headers, _params, model_script)


## Get a table by its unique ID. This endpoint response returns a JSON object with the table metadata.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
##[br]
## Returns:[br]
## - [AppwriteTable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_table(database_id: String, table_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tablesdb/{databaseId}/tables/{tableId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteTable


    return await _call('get', _path, _headers, _params, model_script)


## Update a table by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param xname] [String]: Table name. Max length: 128 chars.[br]
## - [param permissions] [Array]: An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param row_security] [bool]: Enables configuring permissions for individual rows. A user needs one of row or table-level permissions to access a row. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param enabled] [bool]: Is table enabled? When set to &#039;disabled&#039;, users cannot access the table but Server SDKs with and API key can still read and write to the table. No data is lost when this is toggled.[br]
## - [param purge] [bool]: When true, purge all cached list responses for this table as part of the update. Use this to force readers to see fresh data immediately instead of waiting for the cache TTL to expire.[br]
##[br]
## Returns:[br]
## - [AppwriteTable] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_table(database_id: String, table_id: String, xname: Variant = null, permissions: Variant = null, row_security: Variant = null, enabled: Variant = null, purge: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if row_security != null and not row_security is bool:
        return AppwriteException.new("Invalid type for parameter 'row_security'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if purge != null and not purge is bool:
        return AppwriteException.new("Invalid type for parameter 'purge'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if permissions != null:
        _params['permissions'] = permissions
    if row_security != null:
        _params['rowSecurity'] = row_security
    if enabled != null:
        _params['enabled'] = enabled
    if purge != null:
        _params['purge'] = purge

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteTable


    return await _call('put', _path, _headers, _params, model_script)


## Delete a table by its unique ID. Only users with write permissions have access to delete this resource.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_table(database_id: String, table_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tablesdb/{databaseId}/tables/{tableId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## List columns in the table.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: key, type, size, required, array, status, error[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_columns(database_id: String, table_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnList


    return await _call('get', _path, _headers, _params, model_script)


## Create a bigint column. Optionally, minimum and maximum values can be provided.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param default] [int]: Default value. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnBigint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_big_int_column(database_id: String, table_id: String, key: String, required: bool, min: Variant = null, max: Variant = null, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if default != null and not default is int:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected int.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/bigint'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnBigint


    return await _call('post', _path, _headers, _params, model_script)


## Update a bigint column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [int]: Default value. Cannot be set when column is required.[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnBigint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_big_int_column(database_id: String, table_id: String, key: String, required: bool, default: int, min: Variant = null, max: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/bigint/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnBigint


    return await _call('patch', _path, _headers, _params, model_script)


## Create a boolean column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [bool]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnBoolean] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_boolean_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is bool:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected bool.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/boolean'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnBoolean


    return await _call('post', _path, _headers, _params, model_script)


## Update a boolean column. Changing the `default` value will not update already existing rows.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [bool]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnBoolean] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_boolean_column(database_id: String, table_id: String, key: String, required: bool, default: bool, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/boolean/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnBoolean


    return await _call('patch', _path, _headers, _params, model_script)


## Create a date time column according to the ISO 8601 standard.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for the column in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnDatetime] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_datetime_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/datetime'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnDatetime


    return await _call('post', _path, _headers, _params, model_script)


## Update a date time column. Changing the `default` value will not update already existing rows.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnDatetime] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_datetime_column(database_id: String, table_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/datetime/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnDatetime


    return await _call('patch', _path, _headers, _params, model_script)


## Create an email column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnEmail] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_email_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/email'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnEmail


    return await _call('post', _path, _headers, _params, model_script)


## Update an email column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnEmail] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_email_column(database_id: String, table_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/email/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnEmail


    return await _call('patch', _path, _headers, _params, model_script)


## Create an enumeration column. The `elements` param acts as a white-list of accepted values for this column.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param elements] [Array]: Array of enum values.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnEnum] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_enum_column(database_id: String, table_id: String, key: String, elements: Array, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/enum'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnEnum


    return await _call('post', _path, _headers, _params, model_script)


## Update an enum column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param elements] [Array]: Updated list of enum values.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnEnum] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_enum_column(database_id: String, table_id: String, key: String, elements: Array, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/enum/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['elements'] = elements
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnEnum


    return await _call('patch', _path, _headers, _params, model_script)


## Create a float column. Optionally, minimum and maximum values can be provided.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param min] [float]: Minimum value[br]
## - [param max] [float]: Maximum value[br]
## - [param default] [float]: Default value. Cannot be set when required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnFloat] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_float_column(database_id: String, table_id: String, key: String, required: bool, min: Variant = null, max: Variant = null, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is float and not typeof(min) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected float.", 0, "argument_error", "")
    if max != null and not max is float and not typeof(max) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected float.", 0, "argument_error", "")
    if default != null and not default is float and not typeof(default) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected float.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/float'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnFloat


    return await _call('post', _path, _headers, _params, model_script)


## Update a float column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [float]: Default value. Cannot be set when required.[br]
## - [param min] [float]: Minimum value[br]
## - [param max] [float]: Maximum value[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnFloat] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_float_column(database_id: String, table_id: String, key: String, required: bool, default: float, min: Variant = null, max: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is float and not typeof(min) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected float.", 0, "argument_error", "")
    if max != null and not max is float and not typeof(max) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected float.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/float/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnFloat


    return await _call('patch', _path, _headers, _params, model_script)


## Create an integer column. Optionally, minimum and maximum values can be provided.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param default] [int]: Default value. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnInteger] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_integer_column(database_id: String, table_id: String, key: String, required: bool, min: Variant = null, max: Variant = null, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if default != null and not default is int:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected int.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/integer'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnInteger


    return await _call('post', _path, _headers, _params, model_script)


## Update an integer column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [int]: Default value. Cannot be set when column is required.[br]
## - [param min] [int]: Minimum value[br]
## - [param max] [int]: Maximum value[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnInteger] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_integer_column(database_id: String, table_id: String, key: String, required: bool, default: int, min: Variant = null, max: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if min != null and not min is int:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected int.", 0, "argument_error", "")
    if max != null and not max is int:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/integer/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnInteger


    return await _call('patch', _path, _headers, _params, model_script)


## Create IP address column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnIp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_ip_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/ip'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnIp


    return await _call('post', _path, _headers, _params, model_script)


## Update an ip column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnIp] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_ip_column(database_id: String, table_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/ip/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnIp


    return await _call('patch', _path, _headers, _params, model_script)


## Create a geometric line column.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [Array]: Default value for column when not provided, two-dimensional array of coordinate pairs, [[longitude, latitude], [longitude, latitude], …], listing the vertices of the line in order. Cannot be set when column is required.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnLine] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_line_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/line'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnLine


    return await _call('post', _path, _headers, _params, model_script)


## Update a line column. Changing the `default` value will not update already existing rows.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [Array]: Default value for column when not provided, two-dimensional array of coordinate pairs, [[longitude, latitude], [longitude, latitude], …], listing the vertices of the line in order. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnLine] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_line_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/line/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnLine


    return await _call('patch', _path, _headers, _params, model_script)


## Create a longtext column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the column. Encryption enhances security by not storing any plain text values in the database. However, encrypted columns cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnLongtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_longtext_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/longtext'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnLongtext


    return await _call('post', _path, _headers, _params, model_script)


## Update a longtext column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnLongtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_longtext_column(database_id: String, table_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/longtext/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnLongtext


    return await _call('patch', _path, _headers, _params, model_script)


## Create a mediumtext column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the column. Encryption enhances security by not storing any plain text values in the database. However, encrypted columns cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnMediumtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_mediumtext_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/mediumtext'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnMediumtext


    return await _call('post', _path, _headers, _params, model_script)


## Update a mediumtext column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnMediumtext] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_mediumtext_column(database_id: String, table_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/mediumtext/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnMediumtext


    return await _call('patch', _path, _headers, _params, model_script)


## Create a geometric point column.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [Array]: Default value for column when not provided, array of two numbers [longitude, latitude], representing a single coordinate. Cannot be set when column is required.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnPoint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_point_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/point'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnPoint


    return await _call('post', _path, _headers, _params, model_script)


## Update a point column. Changing the `default` value will not update already existing rows.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [Array]: Default value for column when not provided, array of two numbers [longitude, latitude], representing a single coordinate. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnPoint] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_point_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/point/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnPoint


    return await _call('patch', _path, _headers, _params, model_script)


## Create a geometric polygon column.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [Array]: Default value for column when not provided, three-dimensional array where the outer array holds one or more linear rings, [[[longitude, latitude], …], …], the first ring is the exterior boundary, any additional rings are interior holes, and each ring must start and end with the same coordinate pair. Cannot be set when column is required.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnPolygon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_polygon_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/polygon'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnPolygon


    return await _call('post', _path, _headers, _params, model_script)


## Update a polygon column. Changing the `default` value will not update already existing rows.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [Array]: Default value for column when not provided, three-dimensional array where the outer array holds one or more linear rings, [[[longitude, latitude], …], …], the first ring is the exterior boundary, any additional rings are interior holes, and each ring must start and end with the same coordinate pair. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnPolygon] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_polygon_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is Array:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected Array.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/polygon/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnPolygon


    return await _call('patch', _path, _headers, _params, model_script)


## Create relationship column. [Learn more about relationship columns](https://appwrite.io/docs/databases-relationships#relationship-columns).[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param related_table_id] [String]: Related Table ID.[br]
## - [param xtype] [String]: Relation type[br]
## - [param two_way] [bool]: Is Two Way?[br]
## - [param key] [String]: Column Key.[br]
## - [param two_way_key] [String]: Two Way Column Key.[br]
## - [param on_delete] [String]: Constraints option[br]
##[br]
## Returns:[br]
## - [AppwriteColumnRelationship] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_relationship_column(database_id: String, table_id: String, related_table_id: String, xtype: String, two_way: Variant = null, key: Variant = null, two_way_key: Variant = null, on_delete: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if two_way != null and not two_way is bool:
        return AppwriteException.new("Invalid type for parameter 'two_way'. Expected bool.", 0, "argument_error", "")
    if key != null and not key is String:
        return AppwriteException.new("Invalid type for parameter 'key'. Expected String.", 0, "argument_error", "")
    if two_way_key != null and not two_way_key is String:
        return AppwriteException.new("Invalid type for parameter 'two_way_key'. Expected String.", 0, "argument_error", "")
    if on_delete != null and not on_delete is String:
        return AppwriteException.new("Invalid type for parameter 'on_delete'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/relationship'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['relatedTableId'] = related_table_id
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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnRelationship


    return await _call('post', _path, _headers, _params, model_script)


## Create a string column.[br]
##[br]
##[br]
## @deprecated: Since 1.9.0 Use [method tables_create_text_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param size] [int]: Column size for text columns, in number of characters.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the column. Encryption enhances security by not storing any plain text values in the database. However, encrypted columns cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnString] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_string_column(database_id: String, table_id: String, key: String, size: int, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/string'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnString


    return await _call('post', _path, _headers, _params, model_script)


## Update a string column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## @deprecated: Since 1.8.0 Use [method tables_update_text_column] instead.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param size] [int]: Maximum size of the string column.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnString] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_string_column(database_id: String, table_id: String, key: String, required: bool, default: String, size: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if size != null and not size is int:
        return AppwriteException.new("Invalid type for parameter 'size'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/string/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if size != null:
        _params['size'] = size
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnString


    return await _call('patch', _path, _headers, _params, model_script)


## Create a text column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the column. Encryption enhances security by not storing any plain text values in the database. However, encrypted columns cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnText] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_text_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/text'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnText


    return await _call('post', _path, _headers, _params, model_script)


## Update a text column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnText] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_text_column(database_id: String, table_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/text/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnText


    return await _call('patch', _path, _headers, _params, model_script)


## Create a URL column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
##[br]
## Returns:[br]
## - [AppwriteColumnUrl] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_url_column(database_id: String, table_id: String, key: String, required: bool, default: Variant = null, array: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/url'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['required'] = required
    if default != null:
        _params['default'] = default
    if array != null:
        _params['array'] = array

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnUrl


    return await _call('post', _path, _headers, _params, model_script)


## Update an url column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnUrl] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_url_column(database_id: String, table_id: String, key: String, required: bool, default: String, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/url/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnUrl


    return await _call('patch', _path, _headers, _params, model_script)


## Create a varchar column.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param size] [int]: Column size for varchar columns, in number of characters. Maximum size is 16381.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param array] [bool]: Is column an array?[br]
## - [param encrypt] [bool]: Toggle encryption for the column. Encryption enhances security by not storing any plain text values in the database. However, encrypted columns cannot be queried.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnVarchar] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_varchar_column(database_id: String, table_id: String, key: String, size: int, required: bool, default: Variant = null, array: Variant = null, encrypt: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if default != null and not default is String:
        return AppwriteException.new("Invalid type for parameter 'default'. Expected String.", 0, "argument_error", "")
    if array != null and not array is bool:
        return AppwriteException.new("Invalid type for parameter 'array'. Expected bool.", 0, "argument_error", "")
    if encrypt != null and not encrypt is bool:
        return AppwriteException.new("Invalid type for parameter 'encrypt'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/varchar'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnVarchar


    return await _call('post', _path, _headers, _params, model_script)


## Update a varchar column. Changing the `default` value will not update already existing rows.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Column Key.[br]
## - [param required] [bool]: Is column required?[br]
## - [param default] [String]: Default value for column when not provided. Cannot be set when column is required.[br]
## - [param size] [int]: Maximum size of the varchar column.[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnVarchar] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_varchar_column(database_id: String, table_id: String, key: String, required: bool, default: String, size: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if size != null and not size is int:
        return AppwriteException.new("Invalid type for parameter 'size'. Expected int.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/varchar/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    _params['required'] = required
    _params['default'] = default
    if size != null:
        _params['size'] = size
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnVarchar


    return await _call('patch', _path, _headers, _params, model_script)


## Get column by ID.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnBoolean] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_column(database_id: String, table_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnBoolean


    return await _call('get', _path, _headers, _params, model_script)


## Deletes a column.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_column(database_id: String, table_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Update relationship column. [Learn more about relationship columns](https://appwrite.io/docs/databases-relationships#relationship-columns).[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param key] [String]: Column Key.[br]
## - [param on_delete] [String]: Constraints option[br]
## - [param new_key] [String]: New Column Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnRelationship] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_relationship_column(database_id: String, table_id: String, key: String, on_delete: Variant = null, new_key: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if on_delete != null and not on_delete is String:
        return AppwriteException.new("Invalid type for parameter 'on_delete'. Expected String.", 0, "argument_error", "")
    if new_key != null and not new_key is String:
        return AppwriteException.new("Invalid type for parameter 'new_key'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/columns/{key}/relationship'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}
    if on_delete != null:
        _params['onDelete'] = on_delete
    if new_key != null:
        _params['newKey'] = new_key

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnRelationship


    return await _call('patch', _path, _headers, _params, model_script)


## List indexes on the table.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following columns: key, type, status, attributes, error[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnIndexList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_indexes(database_id: String, table_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/indexes'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnIndexList


    return await _call('get', _path, _headers, _params, model_script)


## Creates an index on the columns listed. Your index should include all the columns you will query in a single request.[br]
##Type can be `key`, `fulltext`, or `unique`.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Index Key.[br]
## - [param xtype] [String]: Index type.[br]
## - [param columns] [Array]: Array of columns to index. Maximum of 100 columns are allowed, each 32 characters long.[br]
## - [param orders] [Array[String]]: Array of index orders. Maximum of 100 orders are allowed.[br]
## - [param lengths] [Array]: Length of index. Maximum of 100[br]
##[br]
## Returns:[br]
## - [AppwriteColumnIndex] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_index(database_id: String, table_id: String, key: String, xtype: String, columns: Array, orders: Variant = null, lengths: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if orders != null and not orders is Array:
        return AppwriteException.new("Invalid type for parameter 'orders'. Expected Array[String].", 0, "argument_error", "")
    if lengths != null and not lengths is Array:
        return AppwriteException.new("Invalid type for parameter 'lengths'. Expected Array.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/indexes'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['key'] = key
    _params['type'] = xtype
    _params['columns'] = columns
    if orders != null:
        _params['orders'] = orders
    if lengths != null:
        _params['lengths'] = lengths

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnIndex


    return await _call('post', _path, _headers, _params, model_script)


## Get index by ID.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Index Key.[br]
##[br]
## Returns:[br]
## - [AppwriteColumnIndex] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_index(database_id: String, table_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/indexes/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteColumnIndex


    return await _call('get', _path, _headers, _params, model_script)


## Delete an index.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param key] [String]: Index Key.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_index(database_id: String, table_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/indexes/{key}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{key}', key.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all the user&#039;s rows in a given table. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the TablesDB service [server integration](https://appwrite.io/docs/products/databases/tables#create-table).[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID to read uncommitted changes within the transaction.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
## - [param ttl] [int]: TTL (seconds) for caching list responses. Responses are stored in an in-memory key-value cache, keyed per project, table, schema version (columns and indexes), caller authorization roles, and the exact query — so users with different permissions never share cached entries. Schema changes invalidate cached entries automatically; row writes do not, so choose a TTL you are comfortable serving as stale data. Set to 0 to disable caching. Must be between 0 and 86400 (24 hours).[br]
##[br]
## Returns:[br]
## - [AppwriteRowList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_rows(database_id: String, table_id: String, queries: Variant = null, transaction_id: Variant = null, total: Variant = null, ttl: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")
    if ttl != null and not ttl is int:
        return AppwriteException.new("Invalid type for parameter 'ttl'. Expected int.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

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
        'accept': 'application/json',
    }

    var model_script = AppwriteRowList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new Row. Before using this route, you should create a new table resource using either a [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable) API or directly from your database console.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable). Make sure to define columns before creating rows.[br]
## - [param row_id] [String]: Row ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param data] [Dictionary]: Row data as JSON object.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRow] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_row(database_id: String, table_id: String, row_id: String, data: Dictionary, permissions: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['rowId'] = row_id
    _params['data'] = data
    if permissions != null:
        _params['permissions'] = permissions
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRow


    return await _call('post', _path, _headers, _params, model_script)


## Create new Rows. Before using this route, you should create a new table resource using either a [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable) API or directly from your database console.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable). Make sure to define columns before creating rows.[br]
## - [param rows] [Array]: Array of rows data as JSON objects.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRowList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_rows(database_id: String, table_id: String, rows: Array, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['rows'] = rows
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRowList


    return await _call('post', _path, _headers, _params, model_script)


## Create or update Rows. Before using this route, you should create a new table resource using either a [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable) API or directly from your database console.[br]
##[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param rows] [Array]: Array of row data as JSON objects. May contain partial rows.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRowList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func upsert_rows(database_id: String, table_id: String, rows: Array, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    _params['rows'] = rows
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRowList


    return await _call('put', _path, _headers, _params, model_script)


## Update all rows that match your queries, if no queries are submitted then all rows are updated. You can pass only specific fields to be updated.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param data] [Dictionary]: Row data as JSON object. Include only column and value pairs to be updated.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRowList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_rows(database_id: String, table_id: String, data: Variant = null, queries: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    if data != null:
        _params['data'] = data
    if queries != null:
        _params['queries'] = queries
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRowList


    return await _call('patch', _path, _headers, _params, model_script)


## Bulk delete rows using queries, if no queries are passed then all rows are deleted.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRowList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_rows(database_id: String, table_id: String, queries: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRowList


    return await _call('delete', _path, _headers, _params, model_script)


## Get a row by its unique ID. This endpoint response returns a JSON object with the row data.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param row_id] [String]: Row ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param transaction_id] [String]: Transaction ID to read uncommitted changes within the transaction.[br]
##[br]
## Returns:[br]
## - [AppwriteRow] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_row(database_id: String, table_id: String, row_id: String, queries: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{rowId}', row_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteRow


    return await _call('get', _path, _headers, _params, model_script)


## Create or update a Row. Before using this route, you should create a new table resource using either a [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable) API or directly from your database console.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param row_id] [String]: Row ID.[br]
## - [param data] [Dictionary]: Row data as JSON object. Include all required columns of the row to be created or updated.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRow] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func upsert_row(database_id: String, table_id: String, row_id: String, data: Variant = null, permissions: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{rowId}', row_id.uri_encode())

    var _params := {}
    if data != null:
        _params['data'] = data
    if permissions != null:
        _params['permissions'] = permissions
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRow


    return await _call('put', _path, _headers, _params, model_script)


## Update a row by its unique ID. Using the patch method you can pass only specific fields that will get updated.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param row_id] [String]: Row ID.[br]
## - [param data] [Dictionary]: Row data as JSON object. Include only columns and value pairs to be updated.[br]
## - [param permissions] [Array]: An array of permissions strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRow] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_row(database_id: String, table_id: String, row_id: String, data: Variant = null, permissions: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if data != null and not data is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'data'. Expected Dictionary.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{rowId}', row_id.uri_encode())

    var _params := {}
    if data != null:
        _params['data'] = data
    if permissions != null:
        _params['permissions'] = permissions
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRow


    return await _call('patch', _path, _headers, _params, model_script)


## Delete a row by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID. You can create a new table using the Database service [server integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable).[br]
## - [param row_id] [String]: Row ID.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_row(database_id: String, table_id: String, row_id: String, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{rowId}', row_id.uri_encode())

    var _params := {}
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Decrement a specific column of a row by a given value.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param row_id] [String]: Row ID.[br]
## - [param column] [String]: Column key.[br]
## - [param value] [float]: Value to increment the column by. The value must be a number.[br]
## - [param min] [float]: Minimum value for the column. If the current value is lesser than this value, an exception will be thrown.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRow] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func decrement_row_column(database_id: String, table_id: String, row_id: String, column: String, value: Variant = null, min: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if value != null and not value is float and not typeof(value) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected float.", 0, "argument_error", "")
    if min != null and not min is float and not typeof(min) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'min'. Expected float.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/decrement'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{rowId}', row_id.uri_encode())
    _path = _path.replace('{column}', column.uri_encode())

    var _params := {}
    if value != null:
        _params['value'] = value
    if min != null:
        _params['min'] = min
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRow


    return await _call('patch', _path, _headers, _params, model_script)


## Increment a specific column of a row by a given value.[br]
##[br]
## Parameters:[br]
## - [param database_id] [String]: Database ID.[br]
## - [param table_id] [String]: Table ID.[br]
## - [param row_id] [String]: Row ID.[br]
## - [param column] [String]: Column key.[br]
## - [param value] [float]: Value to increment the column by. The value must be a number.[br]
## - [param max] [float]: Maximum value for the column. If the current value is greater than this value, an error will be thrown.[br]
## - [param transaction_id] [String]: Transaction ID for staging the operation.[br]
##[br]
## Returns:[br]
## - [AppwriteRow] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func increment_row_column(database_id: String, table_id: String, row_id: String, column: String, value: Variant = null, max: Variant = null, transaction_id: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if value != null and not value is float and not typeof(value) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'value'. Expected float.", 0, "argument_error", "")
    if max != null and not max is float and not typeof(max) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'max'. Expected float.", 0, "argument_error", "")
    if transaction_id != null and not transaction_id is String:
        return AppwriteException.new("Invalid type for parameter 'transaction_id'. Expected String.", 0, "argument_error", "")

    var _path := '/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/increment'
    _path = _path.replace('{databaseId}', database_id.uri_encode())
    _path = _path.replace('{tableId}', table_id.uri_encode())
    _path = _path.replace('{rowId}', row_id.uri_encode())
    _path = _path.replace('{column}', column.uri_encode())

    var _params := {}
    if value != null:
        _params['value'] = value
    if max != null:
        _params['max'] = max
    if transaction_id != null:
        _params['transactionId'] = transaction_id

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteRow


    return await _call('patch', _path, _headers, _params, model_script)

