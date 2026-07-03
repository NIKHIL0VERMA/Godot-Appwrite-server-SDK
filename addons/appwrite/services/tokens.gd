extends "../utils/service.gd"
## Service class.


## List all the tokens created for a specific file or bucket. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File unique ID.[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: expire[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteResourceTokenList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list(bucket_id: String, file_id: String, queries: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/tokens/buckets/{bucketId}/files/{fileId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}
    if queries != null:
        _params['queries'] = queries
    if total != null:
        _params['total'] = total

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteResourceTokenList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new token. A token is linked to a file. Token can be passed as a request URL search parameter.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File unique ID.[br]
## - [param expire] [String]: Token expiry date[br]
##[br]
## Returns:[br]
## - [AppwriteResourceToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_file_token(bucket_id: String, file_id: String, expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if expire != null and not expire is String:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected String.", 0, "argument_error", "")

    var _path := '/tokens/buckets/{bucketId}/files/{fileId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteResourceToken


    return await _call('post', _path, _headers, _params, model_script)


## Get a token by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param token_id] [String]: Token ID.[br]
##[br]
## Returns:[br]
## - [AppwriteResourceToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func xget(token_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tokens/{tokenId}'
    _path = _path.replace('{tokenId}', token_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteResourceToken


    return await _call('get', _path, _headers, _params, model_script)


## Update a token by its unique ID. Use this endpoint to update a token&#039;s expiry date.[br]
##[br]
## Parameters:[br]
## - [param token_id] [String]: Token unique ID.[br]
## - [param expire] [String]: File token expiry date[br]
##[br]
## Returns:[br]
## - [AppwriteResourceToken] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update(token_id: String, expire: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if expire != null and not expire is String:
        return AppwriteException.new("Invalid type for parameter 'expire'. Expected String.", 0, "argument_error", "")

    var _path := '/tokens/{tokenId}'
    _path = _path.replace('{tokenId}', token_id.uri_encode())

    var _params := {}
    if expire != null:
        _params['expire'] = expire

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteResourceToken


    return await _call('patch', _path, _headers, _params, model_script)


## Delete a token by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param token_id] [String]: Token ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete(token_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/tokens/{tokenId}'
    _path = _path.replace('{tokenId}', token_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)

