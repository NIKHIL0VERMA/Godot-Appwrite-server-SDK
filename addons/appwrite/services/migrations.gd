extends "../utils/service.gd"
## The Migrations service allows you to migrate third-party data to your Appwrite project.


## List all migrations in the current project. This endpoint returns a list of all migrations including their status, progress, and any errors that occurred during the migration process.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: status, stage, source, destination, resources, resourceId, resourceType, statusCounters, resourceData, errors[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteMigrationList] on success.[br]
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

    var _path := '/migrations'

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if search != null:
        _params['search'] = search
    if total != null:
        _params['total'] = total

    var _headers := {
    }

    var model_script = AppwriteMigrationList

    return await _call('get', _path, _headers, _params, model_script)


## Migrate data from another Appwrite project to your current project. This endpoint allows you to migrate resources like databases, collections, documents, users, and files from an existing Appwrite project. [br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate[br]
## - [param endpoint] [String]: Source Appwrite endpoint[br]
## - [param project_id] [String]: Source Project ID[br]
## - [param api_key] [String]: Source API Key[br]
## - [param on_duplicate] [String]: Behavior when a row with an existing $id is encountered. &quot;fail&quot; (default): abort on first conflict. &quot;skip&quot;: silently ignore. &quot;overwrite&quot;: replace existing row.[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_appwrite_migration(resources: Array[String], endpoint: String, project_id: String, api_key: String, on_duplicate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if on_duplicate != null and not on_duplicate is String:
        return AppwriteException.new("Invalid type for parameter 'on_duplicate'. Expected String.", 0, "argument_error", "")

    var _path := '/migrations/appwrite'

    var _params := {}
    _params['resources'] = resources
    _params['endpoint'] = endpoint
    _params['projectId'] = project_id
    _params['apiKey'] = api_key
    if on_duplicate != null:
        _params['onDuplicate'] = on_duplicate

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Generate a report of the data in an Appwrite project before migrating. This endpoint analyzes the source project and returns information about the resources that can be migrated.[br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate[br]
## - [param endpoint] [String]: Source&#039;s Appwrite Endpoint[br]
## - [param project_id] [String]: Source&#039;s Project ID[br]
## - [param key] [String]: Source&#039;s API Key[br]
##[br]
## Returns:[br]
## - [AppwriteMigrationReport] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_appwrite_report(resources: Array[String], endpoint: String, project_id: String, key: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/migrations/appwrite/report'

    var _params := {}
    _params['resources'] = resources
    _params['endpoint'] = endpoint
    _params['projectID'] = project_id
    _params['key'] = key

    var _headers := {
    }

    var model_script = AppwriteMigrationReport

    return await _call('get', _path, _headers, _params, model_script)


## Export documents to a CSV file from your Appwrite database. This endpoint allows you to export documents to a CSV file stored in a secure internal bucket. You&#039;ll receive an email with a download link when the export is complete.[br]
##[br]
## Parameters:[br]
## - [param resource_id] [String]: Composite ID in the format {databaseId:collectionId}, identifying a collection within a database to export.[br]
## - [param filename] [String]: The name of the file to be created for the export, excluding the .csv extension.[br]
## - [param columns] [Array]: List of attributes to export. If empty, all attributes will be exported. You can use the `*` wildcard to export all attributes from the collection.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK to filter documents to export. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param delimiter] [String]: The character that separates each column value. Default is comma.[br]
## - [param enclosure] [String]: The character that encloses each column value. Default is double quotes.[br]
## - [param escape] [String]: The escape character for the enclosure character. Default is double quotes.[br]
## - [param header] [bool]: Whether to include the header row with column names. Default is true.[br]
## - [param notify] [bool]: Set to true to receive an email when the export is complete. Default is true.[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_csv_export(resource_id: String, filename: String, columns: Variant = null, queries: Variant = null, delimiter: Variant = null, enclosure: Variant = null, escape: Variant = null, header: Variant = null, notify: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if columns != null and not columns is Array:
        return AppwriteException.new("Invalid type for parameter 'columns'. Expected Array.", 0, "argument_error", "")
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if delimiter != null and not delimiter is String:
        return AppwriteException.new("Invalid type for parameter 'delimiter'. Expected String.", 0, "argument_error", "")
    if enclosure != null and not enclosure is String:
        return AppwriteException.new("Invalid type for parameter 'enclosure'. Expected String.", 0, "argument_error", "")
    if escape != null and not escape is String:
        return AppwriteException.new("Invalid type for parameter 'escape'. Expected String.", 0, "argument_error", "")
    if header != null and not header is bool:
        return AppwriteException.new("Invalid type for parameter 'header'. Expected bool.", 0, "argument_error", "")
    if notify != null and not notify is bool:
        return AppwriteException.new("Invalid type for parameter 'notify'. Expected bool.", 0, "argument_error", "")

    var _path := '/migrations/csv/exports'

    var _params := {}
    _params['resourceId'] = resource_id
    _params['filename'] = filename
    if columns != null:
        _params['columns'] = columns
    if queries != null:
        _params['queries'] = queries
    if delimiter != null:
        _params['delimiter'] = delimiter
    if enclosure != null:
        _params['enclosure'] = enclosure
    if escape != null:
        _params['escape'] = escape
    if header != null:
        _params['header'] = header
    if notify != null:
        _params['notify'] = notify

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Import documents from a CSV file into your Appwrite database. This endpoint allows you to import documents from a CSV file uploaded to Appwrite Storage bucket.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID.[br]
## - [param resource_id] [String]: Composite ID in the format {databaseId:collectionId}, identifying a collection within a database.[br]
## - [param internal_file] [bool]: Is the file stored in an internal bucket?[br]
## - [param on_duplicate] [String]: Behavior when a row with an existing $id is encountered. &quot;fail&quot; (default): abort on first conflict. &quot;skip&quot;: silently ignore. &quot;overwrite&quot;: replace existing row.[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_csv_import(bucket_id: String, file_id: String, resource_id: String, internal_file: Variant = null, on_duplicate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if internal_file != null and not internal_file is bool:
        return AppwriteException.new("Invalid type for parameter 'internal_file'. Expected bool.", 0, "argument_error", "")
    if on_duplicate != null and not on_duplicate is String:
        return AppwriteException.new("Invalid type for parameter 'on_duplicate'. Expected String.", 0, "argument_error", "")

    var _path := '/migrations/csv/imports'

    var _params := {}
    _params['bucketId'] = bucket_id
    _params['fileId'] = file_id
    _params['resourceId'] = resource_id
    if internal_file != null:
        _params['internalFile'] = internal_file
    if on_duplicate != null:
        _params['onDuplicate'] = on_duplicate

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Migrate data from a Firebase project to your Appwrite project. This endpoint allows you to migrate resources like authentication and other supported services from a Firebase project. [br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate[br]
## - [param service_account] [String]: JSON of the Firebase service account credentials[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_firebase_migration(resources: Array[String], service_account: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/migrations/firebase'

    var _params := {}
    _params['resources'] = resources
    _params['serviceAccount'] = service_account

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Generate a report of the data in a Firebase project before migrating. This endpoint analyzes the source project and returns information about the resources that can be migrated.[br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate[br]
## - [param service_account] [String]: JSON of the Firebase service account credentials[br]
##[br]
## Returns:[br]
## - [AppwriteMigrationReport] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_firebase_report(resources: Array[String], service_account: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/migrations/firebase/report'

    var _params := {}
    _params['resources'] = resources
    _params['serviceAccount'] = service_account

    var _headers := {
    }

    var model_script = AppwriteMigrationReport

    return await _call('get', _path, _headers, _params, model_script)


## Export documents to a JSON file from your Appwrite database. This endpoint allows you to export documents to a JSON file stored in a secure internal bucket. You&#039;ll receive an email with a download link when the export is complete.[br]
##[br]
##[br]
## Parameters:[br]
## - [param resource_id] [String]: Composite ID in the format {databaseId:collectionId}, identifying a collection within a database to export.[br]
## - [param filename] [String]: The name of the file to be created for the export, excluding the .json extension.[br]
## - [param columns] [Array]: List of attributes to export. If empty, all attributes will be exported. You can use the `*` wildcard to export all attributes from the collection.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK to filter documents to export. [Learn more about queries](https://appwrite.io/docs/databases#querying-documents). Maximum of 100 queries are allowed, each 4096 characters long.[br]
## - [param notify] [bool]: Set to true to receive an email when the export is complete. Default is true.[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_json_export(resource_id: String, filename: String, columns: Variant = null, queries: Variant = null, notify: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if columns != null and not columns is Array:
        return AppwriteException.new("Invalid type for parameter 'columns'. Expected Array.", 0, "argument_error", "")
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if notify != null and not notify is bool:
        return AppwriteException.new("Invalid type for parameter 'notify'. Expected bool.", 0, "argument_error", "")

    var _path := '/migrations/json/exports'

    var _params := {}
    _params['resourceId'] = resource_id
    _params['filename'] = filename
    if columns != null:
        _params['columns'] = columns
    if queries != null:
        _params['queries'] = queries
    if notify != null:
        _params['notify'] = notify

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Import documents from a JSON file into your Appwrite database. This endpoint allows you to import documents from a JSON file uploaded to Appwrite Storage bucket.[br]
##[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID.[br]
## - [param resource_id] [String]: Composite ID in the format {databaseId:collectionId}, identifying a collection within a database.[br]
## - [param internal_file] [bool]: Is the file stored in an internal bucket?[br]
## - [param on_duplicate] [String]: Behavior when a row with an existing $id is encountered. &quot;fail&quot; (default): abort on first conflict. &quot;skip&quot;: silently ignore. &quot;overwrite&quot;: replace existing row.[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_json_import(bucket_id: String, file_id: String, resource_id: String, internal_file: Variant = null, on_duplicate: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if internal_file != null and not internal_file is bool:
        return AppwriteException.new("Invalid type for parameter 'internal_file'. Expected bool.", 0, "argument_error", "")
    if on_duplicate != null and not on_duplicate is String:
        return AppwriteException.new("Invalid type for parameter 'on_duplicate'. Expected String.", 0, "argument_error", "")

    var _path := '/migrations/json/imports'

    var _params := {}
    _params['bucketId'] = bucket_id
    _params['fileId'] = file_id
    _params['resourceId'] = resource_id
    if internal_file != null:
        _params['internalFile'] = internal_file
    if on_duplicate != null:
        _params['onDuplicate'] = on_duplicate

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Migrate data from an NHost project to your Appwrite project. This endpoint allows you to migrate resources like authentication, databases, and other supported services from an NHost project. [br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate[br]
## - [param subdomain] [String]: Source&#039;s Subdomain[br]
## - [param region] [String]: Source&#039;s Region[br]
## - [param admin_secret] [String]: Source&#039;s Admin Secret[br]
## - [param database] [String]: Source&#039;s Database Name[br]
## - [param username] [String]: Source&#039;s Database Username[br]
## - [param password] [String]: Source&#039;s Database Password[br]
## - [param port] [int]: Source&#039;s Database Port[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_n_host_migration(resources: Array[String], subdomain: String, region: String, admin_secret: String, database: String, username: String, password: String, port: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if port != null and not port is int:
        return AppwriteException.new("Invalid type for parameter 'port'. Expected int.", 0, "argument_error", "")

    var _path := '/migrations/nhost'

    var _params := {}
    _params['resources'] = resources
    _params['subdomain'] = subdomain
    _params['region'] = region
    _params['adminSecret'] = admin_secret
    _params['database'] = database
    _params['username'] = username
    _params['password'] = password
    if port != null:
        _params['port'] = port

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Generate a detailed report of the data in an NHost project before migrating. This endpoint analyzes the source project and returns information about the resources that can be migrated. [br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate.[br]
## - [param subdomain] [String]: Source&#039;s Subdomain.[br]
## - [param region] [String]: Source&#039;s Region.[br]
## - [param admin_secret] [String]: Source&#039;s Admin Secret.[br]
## - [param database] [String]: Source&#039;s Database Name.[br]
## - [param username] [String]: Source&#039;s Database Username.[br]
## - [param password] [String]: Source&#039;s Database Password.[br]
## - [param port] [int]: Source&#039;s Database Port.[br]
##[br]
## Returns:[br]
## - [AppwriteMigrationReport] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_n_host_report(resources: Array[String], subdomain: String, region: String, admin_secret: String, database: String, username: String, password: String, port: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if port != null and not port is int:
        return AppwriteException.new("Invalid type for parameter 'port'. Expected int.", 0, "argument_error", "")

    var _path := '/migrations/nhost/report'

    var _params := {}
    _params['resources'] = resources
    _params['subdomain'] = subdomain
    _params['region'] = region
    _params['adminSecret'] = admin_secret
    _params['database'] = database
    _params['username'] = username
    _params['password'] = password
    if port != null:
        _params['port'] = port

    var _headers := {
    }

    var model_script = AppwriteMigrationReport

    return await _call('get', _path, _headers, _params, model_script)


## Migrate data from a Supabase project to your Appwrite project. This endpoint allows you to migrate resources like authentication, databases, and other supported services from a Supabase project. [br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate[br]
## - [param endpoint] [String]: Source&#039;s Supabase Endpoint[br]
## - [param api_key] [String]: Source&#039;s API Key[br]
## - [param database_host] [String]: Source&#039;s Database Host[br]
## - [param username] [String]: Source&#039;s Database Username[br]
## - [param password] [String]: Source&#039;s Database Password[br]
## - [param port] [int]: Source&#039;s Database Port[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_supabase_migration(resources: Array[String], endpoint: String, api_key: String, database_host: String, username: String, password: String, port: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if port != null and not port is int:
        return AppwriteException.new("Invalid type for parameter 'port'. Expected int.", 0, "argument_error", "")

    var _path := '/migrations/supabase'

    var _params := {}
    _params['resources'] = resources
    _params['endpoint'] = endpoint
    _params['apiKey'] = api_key
    _params['databaseHost'] = database_host
    _params['username'] = username
    _params['password'] = password
    if port != null:
        _params['port'] = port

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('post', _path, _headers, _params, model_script)


## Generate a report of the data in a Supabase project before migrating. This endpoint analyzes the source project and returns information about the resources that can be migrated. [br]
##[br]
## Parameters:[br]
## - [param resources] [Array[String]]: List of resources to migrate[br]
## - [param endpoint] [String]: Source&#039;s Supabase Endpoint.[br]
## - [param api_key] [String]: Source&#039;s API Key.[br]
## - [param database_host] [String]: Source&#039;s Database Host.[br]
## - [param username] [String]: Source&#039;s Database Username.[br]
## - [param password] [String]: Source&#039;s Database Password.[br]
## - [param port] [int]: Source&#039;s Database Port.[br]
##[br]
## Returns:[br]
## - [AppwriteMigrationReport] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_supabase_report(resources: Array[String], endpoint: String, api_key: String, database_host: String, username: String, password: String, port: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if port != null and not port is int:
        return AppwriteException.new("Invalid type for parameter 'port'. Expected int.", 0, "argument_error", "")

    var _path := '/migrations/supabase/report'

    var _params := {}
    _params['resources'] = resources
    _params['endpoint'] = endpoint
    _params['apiKey'] = api_key
    _params['databaseHost'] = database_host
    _params['username'] = username
    _params['password'] = password
    if port != null:
        _params['port'] = port

    var _headers := {
    }

    var model_script = AppwriteMigrationReport

    return await _call('get', _path, _headers, _params, model_script)


## Get a migration by its unique ID. This endpoint returns detailed information about a specific migration including its current status, progress, and any errors that occurred during the migration process. [br]
##[br]
## Parameters:[br]
## - [param migration_id] [String]: Migration unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(migration_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/migrations/{migrationId}'
    _path = _path.replace('{migrationId}', str(migration_id))

    var _params := {}

    var _headers := {
    }

    var model_script = AppwriteMigration

    return await _call('get', _path, _headers, _params, model_script)


## Retry a failed migration. This endpoint allows you to retry a migration that has previously failed.[br]
##[br]
## Parameters:[br]
## - [param migration_id] [String]: Migration unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteMigration] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func retry(migration_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/migrations/{migrationId}'
    _path = _path.replace('{migrationId}', str(migration_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = AppwriteMigration

    return await _call('patch', _path, _headers, _params, model_script)


## Delete a migration by its unique ID. This endpoint allows you to remove a migration from your project&#039;s migration history. [br]
##[br]
## Parameters:[br]
## - [param migration_id] [String]: Migration ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(migration_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/migrations/{migrationId}'
    _path = _path.replace('{migrationId}', str(migration_id))

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null

    return await _call('delete', _path, _headers, _params, model_script)

