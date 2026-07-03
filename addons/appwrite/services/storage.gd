extends "../utils/service.gd"
## The Storage service allows you to manage your project files.


## Get a list of all the storage buckets. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: enabled, name, fileSecurity, maximumFileSize, encryption, antivirus, transformations[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteBucketList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_buckets(queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/storage/buckets'

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

    var model_script = AppwriteBucketList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new storage bucket.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Unique Id. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param xname] [String]: Bucket name[br]
## - [param permissions] [Array]: An array of permission strings. By default, no user is granted with any permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param file_security] [bool]: Enables configuring permissions for individual file. A user needs one of file or bucket level permissions to access a file. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param enabled] [bool]: Is bucket enabled? When set to &#039;disabled&#039;, users cannot access the files in this bucket but Server SDKs with and API key can still access the bucket. No files are lost when this is toggled.[br]
## - [param maximum_file_size] [int]: Maximum file size allowed in bytes. Maximum allowed value is 0B.[br]
## - [param allowed_file_extensions] [Array]: Allowed file extensions. Maximum of 100 extensions are allowed, each 64 characters long.[br]
## - [param compression] [String]: Compression algorithm chosen for compression. Can be one of none,  [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd), For file size above 20MB compression is skipped even if it&#039;s enabled[br]
## - [param encryption] [bool]: Is encryption enabled? For file size above 20MB encryption is skipped even if it&#039;s enabled[br]
## - [param antivirus] [bool]: Is virus scanning enabled? For file size above 20MB AntiVirus scanning is skipped even if it&#039;s enabled[br]
## - [param transformations] [bool]: Are image transformations enabled?[br]
##[br]
## Returns:[br]
## - [AppwriteBucket] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_bucket(bucket_id: String, xname: String, permissions: Variant = null, file_security: Variant = null, enabled: Variant = null, maximum_file_size: Variant = null, allowed_file_extensions: Variant = null, compression: Variant = null, encryption: Variant = null, antivirus: Variant = null, transformations: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if file_security != null and not file_security is bool:
        return AppwriteException.new("Invalid type for parameter 'file_security'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if maximum_file_size != null and not maximum_file_size is int:
        return AppwriteException.new("Invalid type for parameter 'maximum_file_size'. Expected int.", 0, "argument_error", "")
    if allowed_file_extensions != null and not allowed_file_extensions is Array:
        return AppwriteException.new("Invalid type for parameter 'allowed_file_extensions'. Expected Array.", 0, "argument_error", "")
    if compression != null and not compression is String:
        return AppwriteException.new("Invalid type for parameter 'compression'. Expected String.", 0, "argument_error", "")
    if encryption != null and not encryption is bool:
        return AppwriteException.new("Invalid type for parameter 'encryption'. Expected bool.", 0, "argument_error", "")
    if antivirus != null and not antivirus is bool:
        return AppwriteException.new("Invalid type for parameter 'antivirus'. Expected bool.", 0, "argument_error", "")
    if transformations != null and not transformations is bool:
        return AppwriteException.new("Invalid type for parameter 'transformations'. Expected bool.", 0, "argument_error", "")

    var _path := '/storage/buckets'

    var _params := {}
    _params['bucketId'] = bucket_id
    _params['name'] = xname
    if permissions != null:
        _params['permissions'] = permissions
    if file_security != null:
        _params['fileSecurity'] = file_security
    if enabled != null:
        _params['enabled'] = enabled
    if maximum_file_size != null:
        _params['maximumFileSize'] = maximum_file_size
    if allowed_file_extensions != null:
        _params['allowedFileExtensions'] = allowed_file_extensions
    if compression != null:
        _params['compression'] = compression
    if encryption != null:
        _params['encryption'] = encryption
    if antivirus != null:
        _params['antivirus'] = antivirus
    if transformations != null:
        _params['transformations'] = transformations

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteBucket


    return await _call('post', _path, _headers, _params, model_script)


## Get a storage bucket by its unique ID. This endpoint response returns a JSON object with the storage bucket metadata.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Bucket unique ID.[br]
##[br]
## Returns:[br]
## - [AppwriteBucket] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_bucket(bucket_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/storage/buckets/{bucketId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteBucket


    return await _call('get', _path, _headers, _params, model_script)


## Update a storage bucket by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Bucket unique ID.[br]
## - [param xname] [String]: Bucket name[br]
## - [param permissions] [Array]: An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param file_security] [bool]: Enables configuring permissions for individual file. A user needs one of file or bucket level permissions to access a file. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
## - [param enabled] [bool]: Is bucket enabled? When set to &#039;disabled&#039;, users cannot access the files in this bucket but Server SDKs with and API key can still access the bucket. No files are lost when this is toggled.[br]
## - [param maximum_file_size] [int]: Maximum file size allowed in bytes. Maximum allowed value is 0B.[br]
## - [param allowed_file_extensions] [Array]: Allowed file extensions. Maximum of 100 extensions are allowed, each 64 characters long.[br]
## - [param compression] [String]: Compression algorithm chosen for compression. Can be one of none, [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd), For file size above 20MB compression is skipped even if it&#039;s enabled[br]
## - [param encryption] [bool]: Is encryption enabled? For file size above 20MB encryption is skipped even if it&#039;s enabled[br]
## - [param antivirus] [bool]: Is virus scanning enabled? For file size above 20MB AntiVirus scanning is skipped even if it&#039;s enabled[br]
## - [param transformations] [bool]: Are image transformations enabled?[br]
##[br]
## Returns:[br]
## - [AppwriteBucket] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_bucket(bucket_id: String, xname: String, permissions: Variant = null, file_security: Variant = null, enabled: Variant = null, maximum_file_size: Variant = null, allowed_file_extensions: Variant = null, compression: Variant = null, encryption: Variant = null, antivirus: Variant = null, transformations: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")
    if file_security != null and not file_security is bool:
        return AppwriteException.new("Invalid type for parameter 'file_security'. Expected bool.", 0, "argument_error", "")
    if enabled != null and not enabled is bool:
        return AppwriteException.new("Invalid type for parameter 'enabled'. Expected bool.", 0, "argument_error", "")
    if maximum_file_size != null and not maximum_file_size is int:
        return AppwriteException.new("Invalid type for parameter 'maximum_file_size'. Expected int.", 0, "argument_error", "")
    if allowed_file_extensions != null and not allowed_file_extensions is Array:
        return AppwriteException.new("Invalid type for parameter 'allowed_file_extensions'. Expected Array.", 0, "argument_error", "")
    if compression != null and not compression is String:
        return AppwriteException.new("Invalid type for parameter 'compression'. Expected String.", 0, "argument_error", "")
    if encryption != null and not encryption is bool:
        return AppwriteException.new("Invalid type for parameter 'encryption'. Expected bool.", 0, "argument_error", "")
    if antivirus != null and not antivirus is bool:
        return AppwriteException.new("Invalid type for parameter 'antivirus'. Expected bool.", 0, "argument_error", "")
    if transformations != null and not transformations is bool:
        return AppwriteException.new("Invalid type for parameter 'transformations'. Expected bool.", 0, "argument_error", "")

    var _path := '/storage/buckets/{bucketId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())

    var _params := {}
    _params['name'] = xname
    if permissions != null:
        _params['permissions'] = permissions
    if file_security != null:
        _params['fileSecurity'] = file_security
    if enabled != null:
        _params['enabled'] = enabled
    if maximum_file_size != null:
        _params['maximumFileSize'] = maximum_file_size
    if allowed_file_extensions != null:
        _params['allowedFileExtensions'] = allowed_file_extensions
    if compression != null:
        _params['compression'] = compression
    if encryption != null:
        _params['encryption'] = encryption
    if antivirus != null:
        _params['antivirus'] = antivirus
    if transformations != null:
        _params['transformations'] = transformations

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteBucket


    return await _call('put', _path, _headers, _params, model_script)


## Delete a storage bucket by its unique ID.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Bucket unique ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_bucket(bucket_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/storage/buckets/{bucketId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Get a list of all the user files. You can use the query params to filter your results.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param queries] [Array]: Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, signature, mimeType, sizeOriginal, chunksTotal, chunksUploaded[br]
## - [param search] [String]: Search term to filter your list results. Max length: 256 chars.[br]
## - [param total] [bool]: When set to false, the total count returned will be 0 and will not be calculated.[br]
##[br]
## Returns:[br]
## - [AppwriteFileList] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func list_files(bucket_id: String, queries: Variant = null, search: Variant = null, total: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if queries != null and not queries is Array:
        return AppwriteException.new("Invalid type for parameter 'queries'. Expected Array.", 0, "argument_error", "")
    if search != null and not search is String:
        return AppwriteException.new("Invalid type for parameter 'search'. Expected String.", 0, "argument_error", "")
    if total != null and not total is bool:
        return AppwriteException.new("Invalid type for parameter 'total'. Expected bool.", 0, "argument_error", "")

    var _path := '/storage/buckets/{bucketId}/files'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())

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

    var model_script = AppwriteFileList


    return await _call('get', _path, _headers, _params, model_script)


## Create a new file. Before using this route, you should create a new bucket resource using either a [server integration](https://appwrite.io/docs/server/storage#storageCreateBucket) API or directly from your Appwrite console.[br]
##[br]
##Larger files should be uploaded using multiple requests with the [content-range](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Range) header to send a partial request with a maximum supported chunk of `5MB`. The `content-range` header values should always be in bytes.[br]
##[br]
##When the first request is sent, the server will return the **File** object, and the subsequent part request must include the file&#039;s **id** in `x-appwrite-id` header to allow the server to know that the partial upload is for the existing file and not for a new one.[br]
##[br]
##If you&#039;re creating a new file using one of the Appwrite SDKs, all the chunking logic will be managed by the SDK internally.[br]
##[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.[br]
## - [param file] [AppwriteInputFile]: Binary file. Appwrite SDKs provide helpers to handle file input. [Learn about file input](https://appwrite.io/docs/products/storage/upload-download#input-file).[br]
## - [param permissions] [Array]: An array of permission strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
##[br]
## Returns:[br]
## - [AppwriteFile] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func create_file(bucket_id: String, file_id: String, file: AppwriteInputFile, permissions: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")

    var _path := '/storage/buckets/{bucketId}/files'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())

    var _params := {}
    _params['fileId'] = file_id
    _params['file'] = file
    if permissions != null:
        _params['permissions'] = permissions

    var _headers := {
        'content-type': 'multipart/form-data',
        'accept': 'application/json',
    }

    var model_script = AppwriteFile


    return await _call('post', _path, _headers, _params, model_script)


## Get a file by its unique ID. This endpoint response returns a JSON object with the file metadata.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID.[br]
##[br]
## Returns:[br]
## - [AppwriteFile] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_file(bucket_id: String, file_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/storage/buckets/{bucketId}/files/{fileId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}

    var _headers := {
        'accept': 'application/json',
    }

    var model_script = AppwriteFile


    return await _call('get', _path, _headers, _params, model_script)


## Update a file by its unique ID. Only users with write permissions have access to update this resource.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Bucket unique ID.[br]
## - [param file_id] [String]: File ID.[br]
## - [param xname] [String]: File name.[br]
## - [param permissions] [Array]: An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).[br]
##[br]
## Returns:[br]
## - [AppwriteFile] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func update_file(bucket_id: String, file_id: String, xname: Variant = null, permissions: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array.", 0, "argument_error", "")

    var _path := '/storage/buckets/{bucketId}/files/{fileId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if permissions != null:
        _params['permissions'] = permissions

    var _headers := {
        'content-type': 'application/json',
        'accept': 'application/json',
    }

    var model_script = AppwriteFile


    return await _call('put', _path, _headers, _params, model_script)


## Delete a file by its unique ID. Only users with write permissions have access to delete this resource.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func delete_file(bucket_id: String, file_id: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/storage/buckets/{bucketId}/files/{fileId}'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}

    var _headers := {
        'content-type': 'application/json',
    }

    var model_script = null


    return await _call('delete', _path, _headers, _params, model_script)


## Get a file content by its unique ID. The endpoint response return with a &#039;Content-Disposition: attachment&#039; header that tells the browser to start downloading the file to user downloads directory.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID.[br]
## - [param token] [String]: File token for accessing this file.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_file_download(bucket_id: String, file_id: String, token: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if token != null and not token is String:
        return AppwriteException.new("Invalid type for parameter 'token'. Expected String.", 0, "argument_error", "")

    var _path := '/storage/buckets/{bucketId}/files/{fileId}/download'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}
    if token != null:
        _params['token'] = token

    var _headers := {
        'accept': '*/*',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## Get a file preview image. Currently, this method supports preview for image files (jpg, png, and gif), other supported formats, like pdf, docs, slides, and spreadsheets, will return the file icon image. You can also pass query string arguments for cutting and resizing your preview image. Preview is supported only for image files smaller than 10MB.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID[br]
## - [param width] [int]: Resize preview image width, Pass an integer between 0 to 4000.[br]
## - [param height] [int]: Resize preview image height, Pass an integer between 0 to 4000.[br]
## - [param gravity] [String]: Image crop gravity. Can be one of center,top-left,top,top-right,left,right,bottom-left,bottom,bottom-right[br]
## - [param quality] [int]: Preview image quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.[br]
## - [param border_width] [int]: Preview image border in pixels. Pass an integer between 0 to 100. Defaults to 0.[br]
## - [param border_color] [String]: Preview image border color. Use a valid HEX color, no # is needed for prefix.[br]
## - [param border_radius] [int]: Preview image border radius in pixels. Pass an integer between 0 to 4000.[br]
## - [param opacity] [float]: Preview image opacity. Only works with images having an alpha channel (like png). Pass a number between 0 to 1.[br]
## - [param rotation] [int]: Preview image rotation in degrees. Pass an integer between -360 and 360.[br]
## - [param background] [String]: Preview image background color. Only works with transparent images (png). Use a valid HEX color, no # is needed for prefix.[br]
## - [param output] [String]: Output format type (jpeg, jpg, png, gif and webp).[br]
## - [param token] [String]: File token for accessing this file.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_file_preview(bucket_id: String, file_id: String, width: Variant = null, height: Variant = null, gravity: Variant = null, quality: Variant = null, border_width: Variant = null, border_color: Variant = null, border_radius: Variant = null, opacity: Variant = null, rotation: Variant = null, background: Variant = null, output: Variant = null, token: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if width != null and not width is int:
        return AppwriteException.new("Invalid type for parameter 'width'. Expected int.", 0, "argument_error", "")
    if height != null and not height is int:
        return AppwriteException.new("Invalid type for parameter 'height'. Expected int.", 0, "argument_error", "")
    if gravity != null and not gravity is String:
        return AppwriteException.new("Invalid type for parameter 'gravity'. Expected String.", 0, "argument_error", "")
    if quality != null and not quality is int:
        return AppwriteException.new("Invalid type for parameter 'quality'. Expected int.", 0, "argument_error", "")
    if border_width != null and not border_width is int:
        return AppwriteException.new("Invalid type for parameter 'border_width'. Expected int.", 0, "argument_error", "")
    if border_color != null and not border_color is String:
        return AppwriteException.new("Invalid type for parameter 'border_color'. Expected String.", 0, "argument_error", "")
    if border_radius != null and not border_radius is int:
        return AppwriteException.new("Invalid type for parameter 'border_radius'. Expected int.", 0, "argument_error", "")
    if opacity != null and not opacity is float and not typeof(opacity) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'opacity'. Expected float.", 0, "argument_error", "")
    if rotation != null and not rotation is int:
        return AppwriteException.new("Invalid type for parameter 'rotation'. Expected int.", 0, "argument_error", "")
    if background != null and not background is String:
        return AppwriteException.new("Invalid type for parameter 'background'. Expected String.", 0, "argument_error", "")
    if output != null and not output is String:
        return AppwriteException.new("Invalid type for parameter 'output'. Expected String.", 0, "argument_error", "")
    if token != null and not token is String:
        return AppwriteException.new("Invalid type for parameter 'token'. Expected String.", 0, "argument_error", "")

    var _path := '/storage/buckets/{bucketId}/files/{fileId}/preview'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}
    if width != null:
        _params['width'] = width
    if height != null:
        _params['height'] = height
    if gravity != null:
        _params['gravity'] = gravity
    if quality != null:
        _params['quality'] = quality
    if border_width != null:
        _params['borderWidth'] = border_width
    if border_color != null:
        _params['borderColor'] = border_color
    if border_radius != null:
        _params['borderRadius'] = border_radius
    if opacity != null:
        _params['opacity'] = opacity
    if rotation != null:
        _params['rotation'] = rotation
    if background != null:
        _params['background'] = background
    if output != null:
        _params['output'] = output
    if token != null:
        _params['token'] = token

    var _headers := {
        'accept': 'image/*',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## Get a file content by its unique ID. This endpoint is similar to the download method but returns with no  &#039;Content-Disposition: attachment&#039; header.[br]
##[br]
## Parameters:[br]
## - [param bucket_id] [String]: Storage bucket unique ID. You can create a new storage bucket using the Storage service [server integration](https://appwrite.io/docs/server/storage#createBucket).[br]
## - [param file_id] [String]: File ID.[br]
## - [param token] [String]: File token for accessing this file.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_file_view(bucket_id: String, file_id: String, token: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if token != null and not token is String:
        return AppwriteException.new("Invalid type for parameter 'token'. Expected String.", 0, "argument_error", "")

    var _path := '/storage/buckets/{bucketId}/files/{fileId}/view'
    _path = _path.replace('{bucketId}', bucket_id.uri_encode())
    _path = _path.replace('{fileId}', file_id.uri_encode())

    var _params := {}
    if token != null:
        _params['token'] = token

    var _headers := {
        'accept': '*/*',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)

