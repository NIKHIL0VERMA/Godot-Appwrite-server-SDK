extends "../utils/service.gd"
## The Avatars service aims to help you complete everyday tasks related to your app image, icons, and avatars.


## You can use this endpoint to show different browser icons to your users. The code argument receives the browser code as it appears in your user [GET /account/sessions](https://appwrite.io/docs/references/cloud/client-web/account#getSessions) endpoint. Use width, height and quality arguments to change the output settings.[br]
##[br]
##When one dimension is specified and the other is 0, the image is scaled with preserved aspect ratio. If both dimensions are 0, the API provides an image at source quality. If dimensions are not specified, the default size of image returned is 100x100px.[br]
##[br]
## Parameters:[br]
## - [param code] [String]: Browser Code.[br]
## - [param width] [int]: Image width. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param height] [int]: Image height. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param quality] [int]: Image quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_browser(code: String, width: Variant = null, height: Variant = null, quality: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if width != null and not width is int:
        return AppwriteException.new("Invalid type for parameter 'width'. Expected int.", 0, "argument_error", "")
    if height != null and not height is int:
        return AppwriteException.new("Invalid type for parameter 'height'. Expected int.", 0, "argument_error", "")
    if quality != null and not quality is int:
        return AppwriteException.new("Invalid type for parameter 'quality'. Expected int.", 0, "argument_error", "")

    var _path := '/avatars/browsers/{code}'
    _path = _path.replace('{code}', code.uri_encode())

    var _params := {}
    if width != null:
        _params['width'] = width
    if height != null:
        _params['height'] = height
    if quality != null:
        _params['quality'] = quality

    var _headers := {
        'accept': 'image/png',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## The credit card endpoint will return you the icon of the credit card provider you need. Use width, height and quality arguments to change the output settings.[br]
##[br]
##When one dimension is specified and the other is 0, the image is scaled with preserved aspect ratio. If both dimensions are 0, the API provides an image at source quality. If dimensions are not specified, the default size of image returned is 100x100px.[br]
##[br]
##[br]
## Parameters:[br]
## - [param code] [String]: Credit Card Code. Possible values: amex, argencard, cabal, cencosud, diners, discover, elo, hipercard, jcb, mastercard, naranja, targeta-shopping, unionpay, visa, mir, maestro, rupay.[br]
## - [param width] [int]: Image width. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param height] [int]: Image height. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param quality] [int]: Image quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_credit_card(code: String, width: Variant = null, height: Variant = null, quality: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if width != null and not width is int:
        return AppwriteException.new("Invalid type for parameter 'width'. Expected int.", 0, "argument_error", "")
    if height != null and not height is int:
        return AppwriteException.new("Invalid type for parameter 'height'. Expected int.", 0, "argument_error", "")
    if quality != null and not quality is int:
        return AppwriteException.new("Invalid type for parameter 'quality'. Expected int.", 0, "argument_error", "")

    var _path := '/avatars/credit-cards/{code}'
    _path = _path.replace('{code}', code.uri_encode())

    var _params := {}
    if width != null:
        _params['width'] = width
    if height != null:
        _params['height'] = height
    if quality != null:
        _params['quality'] = quality

    var _headers := {
        'accept': 'image/png',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to fetch the favorite icon (AKA favicon) of any remote website URL.[br]
##[br]
##This endpoint does not follow HTTP redirects.[br]
##[br]
## Parameters:[br]
## - [param url] [String]: Website URL which you want to fetch the favicon from.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_favicon(url: String) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional

    var _path := '/avatars/favicon'

    var _params := {}
    _params['url'] = url

    var _headers := {
        'accept': 'image/*',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## You can use this endpoint to show different country flags icons to your users. The code argument receives the 2 letter country code. Use width, height and quality arguments to change the output settings. Country codes follow the [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1) standard.[br]
##[br]
##When one dimension is specified and the other is 0, the image is scaled with preserved aspect ratio. If both dimensions are 0, the API provides an image at source quality. If dimensions are not specified, the default size of image returned is 100x100px.[br]
##[br]
##[br]
## Parameters:[br]
## - [param code] [String]: Country Code. ISO Alpha-2 country code format.[br]
## - [param width] [int]: Image width. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param height] [int]: Image height. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param quality] [int]: Image quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_flag(code: String, width: Variant = null, height: Variant = null, quality: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if width != null and not width is int:
        return AppwriteException.new("Invalid type for parameter 'width'. Expected int.", 0, "argument_error", "")
    if height != null and not height is int:
        return AppwriteException.new("Invalid type for parameter 'height'. Expected int.", 0, "argument_error", "")
    if quality != null and not quality is int:
        return AppwriteException.new("Invalid type for parameter 'quality'. Expected int.", 0, "argument_error", "")

    var _path := '/avatars/flags/{code}'
    _path = _path.replace('{code}', code.uri_encode())

    var _params := {}
    if width != null:
        _params['width'] = width
    if height != null:
        _params['height'] = height
    if quality != null:
        _params['quality'] = quality

    var _headers := {
        'accept': 'image/png',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to fetch a remote image URL and crop it to any image size you want. This endpoint is very useful if you need to crop and display remote images in your app or in case you want to make sure a 3rd party image is properly served using a TLS protocol.[br]
##[br]
##When one dimension is specified and the other is 0, the image is scaled with preserved aspect ratio. If both dimensions are 0, the API provides an image at source quality. If dimensions are not specified, the default size of image returned is 400x400px.[br]
##[br]
##This endpoint does not follow HTTP redirects.[br]
##[br]
## Parameters:[br]
## - [param url] [String]: Image URL which you want to crop.[br]
## - [param width] [int]: Resize preview image width, Pass an integer between 0 to 2000. Defaults to 400.[br]
## - [param height] [int]: Resize preview image height, Pass an integer between 0 to 2000. Defaults to 400.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_image(url: String, width: Variant = null, height: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if width != null and not width is int:
        return AppwriteException.new("Invalid type for parameter 'width'. Expected int.", 0, "argument_error", "")
    if height != null and not height is int:
        return AppwriteException.new("Invalid type for parameter 'height'. Expected int.", 0, "argument_error", "")

    var _path := '/avatars/image'

    var _params := {}
    _params['url'] = url
    if width != null:
        _params['width'] = width
    if height != null:
        _params['height'] = height

    var _headers := {
        'accept': 'image/*',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to show your user initials avatar icon on your website or app. By default, this route will try to print your logged-in user name or email initials. You can also overwrite the user name if you pass the &#039;name&#039; parameter. If no name is given and no user is logged, an empty avatar will be returned.[br]
##[br]
##You can use the color and background params to change the avatar colors. By default, a random theme will be selected. The random theme will persist for the user&#039;s initials when reloading the same theme will always return for the same initials.[br]
##[br]
##When one dimension is specified and the other is 0, the image is scaled with preserved aspect ratio. If both dimensions are 0, the API provides an image at source quality. If dimensions are not specified, the default size of image returned is 100x100px.[br]
##[br]
##[br]
## Parameters:[br]
## - [param xname] [String]: Full Name. When empty, current user name or email will be used. Max length: 128 chars.[br]
## - [param width] [int]: Image width. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param height] [int]: Image height. Pass an integer between 0 to 2000. Defaults to 100.[br]
## - [param background] [String]: Changes background color. By default a random color will be picked and stay will persistent to the given name.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_initials(xname: Variant = null, width: Variant = null, height: Variant = null, background: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if xname != null and not xname is String:
        return AppwriteException.new("Invalid type for parameter 'xname'. Expected String.", 0, "argument_error", "")
    if width != null and not width is int:
        return AppwriteException.new("Invalid type for parameter 'width'. Expected int.", 0, "argument_error", "")
    if height != null and not height is int:
        return AppwriteException.new("Invalid type for parameter 'height'. Expected int.", 0, "argument_error", "")
    if background != null and not background is String:
        return AppwriteException.new("Invalid type for parameter 'background'. Expected String.", 0, "argument_error", "")

    var _path := '/avatars/initials'

    var _params := {}
    if xname != null:
        _params['name'] = xname
    if width != null:
        _params['width'] = width
    if height != null:
        _params['height'] = height
    if background != null:
        _params['background'] = background

    var _headers := {
        'accept': 'image/png',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## Converts a given plain text to a QR code image. You can use the query parameters to change the size and style of the resulting image.[br]
##[br]
##[br]
## Parameters:[br]
## - [param text] [String]: Plain text to be converted to QR code image.[br]
## - [param size] [int]: QR code size. Pass an integer between 1 to 1000. Defaults to 400.[br]
## - [param margin] [int]: Margin from edge. Pass an integer between 0 to 10. Defaults to 1.[br]
## - [param download] [bool]: Return resulting image with &#039;Content-Disposition: attachment &#039; headers for the browser to start downloading it. Pass 0 for no header, or 1 for otherwise. Default value is set to 0.[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_qr(text: String, size: Variant = null, margin: Variant = null, download: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if size != null and not size is int:
        return AppwriteException.new("Invalid type for parameter 'size'. Expected int.", 0, "argument_error", "")
    if margin != null and not margin is int:
        return AppwriteException.new("Invalid type for parameter 'margin'. Expected int.", 0, "argument_error", "")
    if download != null and not download is bool:
        return AppwriteException.new("Invalid type for parameter 'download'. Expected bool.", 0, "argument_error", "")

    var _path := '/avatars/qr'

    var _params := {}
    _params['text'] = text
    if size != null:
        _params['size'] = size
    if margin != null:
        _params['margin'] = margin
    if download != null:
        _params['download'] = download

    var _headers := {
        'accept': 'image/png',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)


## Use this endpoint to capture a screenshot of any website URL. This endpoint uses a headless browser to render the webpage and capture it as an image.[br]
##[br]
##You can configure the browser viewport size, theme, user agent, geolocation, permissions, and more. Capture either just the viewport or the full page scroll.[br]
##[br]
##When width and height are specified, the image is resized accordingly. If both dimensions are 0, the API provides an image at original size. If dimensions are not specified, the default viewport size is 1280x720px.[br]
##[br]
## Parameters:[br]
## - [param url] [String]: Website URL which you want to capture.[br]
## - [param headers] [Dictionary]: HTTP headers to send with the browser request. Defaults to empty.[br]
## - [param viewport_width] [int]: Browser viewport width. Pass an integer between 1 to 1920. Defaults to 1280.[br]
## - [param viewport_height] [int]: Browser viewport height. Pass an integer between 1 to 1080. Defaults to 720.[br]
## - [param scale] [float]: Browser scale factor. Pass a number between 0.1 to 3. Defaults to 1.[br]
## - [param theme] [String]: Browser theme. Pass &quot;light&quot; or &quot;dark&quot;. Defaults to &quot;light&quot;.[br]
## - [param user_agent] [String]: Custom user agent string. Defaults to browser default.[br]
## - [param fullpage] [bool]: Capture full page scroll. Pass 0 for viewport only, or 1 for full page. Defaults to 0.[br]
## - [param locale] [String]: Browser locale (e.g., &quot;en-US&quot;, &quot;fr-FR&quot;). Defaults to browser default.[br]
## - [param timezone] [String]: IANA timezone identifier (e.g., &quot;America/New_York&quot;, &quot;Europe/London&quot;). Defaults to browser default.[br]
## - [param latitude] [float]: Geolocation latitude. Pass a number between -90 to 90. Defaults to 0.[br]
## - [param longitude] [float]: Geolocation longitude. Pass a number between -180 to 180. Defaults to 0.[br]
## - [param accuracy] [float]: Geolocation accuracy in meters. Pass a number between 0 to 100000. Defaults to 0.[br]
## - [param touch] [bool]: Enable touch support. Pass 0 for no touch, or 1 for touch enabled. Defaults to 0.[br]
## - [param permissions] [Array[String]]: Browser permissions to grant. Pass an array of permission names like [&quot;geolocation&quot;, &quot;camera&quot;, &quot;microphone&quot;]. Defaults to empty.[br]
## - [param sleep] [int]: Wait time in seconds before taking the screenshot. Pass an integer between 0 to 10. Defaults to 0.[br]
## - [param width] [int]: Output image width. Pass 0 to use original width, or an integer between 1 to 2000. Defaults to 0 (original width).[br]
## - [param height] [int]: Output image height. Pass 0 to use original height, or an integer between 1 to 2000. Defaults to 0 (original height).[br]
## - [param quality] [int]: Screenshot quality. Pass an integer between 0 to 100. Defaults to keep existing image quality.[br]
## - [param output] [String]: Output format type (jpeg, jpg, png, gif and webp).[br]
##[br]
## Returns:[br]
## - [Variant] on success.[br]
##[br]
## Errors:[br]
## - Returns error data as [member AppwriteException].
func get_screenshot(url: String, headers: Variant = null, viewport_width: Variant = null, viewport_height: Variant = null, scale: Variant = null, theme: Variant = null, user_agent: Variant = null, fullpage: Variant = null, locale: Variant = null, timezone: Variant = null, latitude: Variant = null, longitude: Variant = null, accuracy: Variant = null, touch: Variant = null, permissions: Variant = null, sleep: Variant = null, width: Variant = null, height: Variant = null, quality: Variant = null, output: Variant = null) -> Variant :
    # Runtime type checking, GDScript typed vars don't support null or optional
    if headers != null and not headers is Dictionary:
        return AppwriteException.new("Invalid type for parameter 'headers'. Expected Dictionary.", 0, "argument_error", "")
    if viewport_width != null and not viewport_width is int:
        return AppwriteException.new("Invalid type for parameter 'viewport_width'. Expected int.", 0, "argument_error", "")
    if viewport_height != null and not viewport_height is int:
        return AppwriteException.new("Invalid type for parameter 'viewport_height'. Expected int.", 0, "argument_error", "")
    if scale != null and not scale is float and not typeof(scale) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'scale'. Expected float.", 0, "argument_error", "")
    if theme != null and not theme is String:
        return AppwriteException.new("Invalid type for parameter 'theme'. Expected String.", 0, "argument_error", "")
    if user_agent != null and not user_agent is String:
        return AppwriteException.new("Invalid type for parameter 'user_agent'. Expected String.", 0, "argument_error", "")
    if fullpage != null and not fullpage is bool:
        return AppwriteException.new("Invalid type for parameter 'fullpage'. Expected bool.", 0, "argument_error", "")
    if locale != null and not locale is String:
        return AppwriteException.new("Invalid type for parameter 'locale'. Expected String.", 0, "argument_error", "")
    if timezone != null and not timezone is String:
        return AppwriteException.new("Invalid type for parameter 'timezone'. Expected String.", 0, "argument_error", "")
    if latitude != null and not latitude is float and not typeof(latitude) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'latitude'. Expected float.", 0, "argument_error", "")
    if longitude != null and not longitude is float and not typeof(longitude) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'longitude'. Expected float.", 0, "argument_error", "")
    if accuracy != null and not accuracy is float and not typeof(accuracy) == TYPE_INT:
        return AppwriteException.new("Invalid type for parameter 'accuracy'. Expected float.", 0, "argument_error", "")
    if touch != null and not touch is bool:
        return AppwriteException.new("Invalid type for parameter 'touch'. Expected bool.", 0, "argument_error", "")
    if permissions != null and not permissions is Array:
        return AppwriteException.new("Invalid type for parameter 'permissions'. Expected Array[String].", 0, "argument_error", "")
    if sleep != null and not sleep is int:
        return AppwriteException.new("Invalid type for parameter 'sleep'. Expected int.", 0, "argument_error", "")
    if width != null and not width is int:
        return AppwriteException.new("Invalid type for parameter 'width'. Expected int.", 0, "argument_error", "")
    if height != null and not height is int:
        return AppwriteException.new("Invalid type for parameter 'height'. Expected int.", 0, "argument_error", "")
    if quality != null and not quality is int:
        return AppwriteException.new("Invalid type for parameter 'quality'. Expected int.", 0, "argument_error", "")
    if output != null and not output is String:
        return AppwriteException.new("Invalid type for parameter 'output'. Expected String.", 0, "argument_error", "")

    var _path := '/avatars/screenshots'

    var _params := {}
    _params['url'] = url
    if headers != null:
        _params['headers'] = headers
    if viewport_width != null:
        _params['viewportWidth'] = viewport_width
    if viewport_height != null:
        _params['viewportHeight'] = viewport_height
    if scale != null:
        _params['scale'] = scale
    if theme != null:
        _params['theme'] = theme
    if user_agent != null:
        _params['userAgent'] = user_agent
    if fullpage != null:
        _params['fullpage'] = fullpage
    if locale != null:
        _params['locale'] = locale
    if timezone != null:
        _params['timezone'] = timezone
    if latitude != null:
        _params['latitude'] = latitude
    if longitude != null:
        _params['longitude'] = longitude
    if accuracy != null:
        _params['accuracy'] = accuracy
    if touch != null:
        _params['touch'] = touch
    if permissions != null:
        _params['permissions'] = permissions
    if sleep != null:
        _params['sleep'] = sleep
    if width != null:
        _params['width'] = width
    if height != null:
        _params['height'] = height
    if quality != null:
        _params['quality'] = quality
    if output != null:
        _params['output'] = output

    var _headers := {
        'accept': 'image/png',
    }

    var model_script = null

    _params['project'] = client.get_headers()['x-appwrite-project']
    _params['session'] = client.get_headers()['x-appwrite-session']
    _params['impersonateuserid'] = client.get_headers()['x-appwrite-impersonate-user-id']

    return await _call('get', _path, _headers, _params, model_script)

