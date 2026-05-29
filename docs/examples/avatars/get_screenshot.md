Use this endpoint to capture a screenshot of any website URL. This endpoint uses a headless browser to render the webpage and capture it as an image.

You can configure the browser viewport size, theme, user agent, geolocation, permissions, and more. Capture either just the viewport or the full page scroll.

When width and height are specified, the image is resized accordingly. If both dimensions are 0, the API provides an image at original size. If dimensions are not specified, the default viewport size is 1280x720px.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.avatars.get_screenshot(
        'https://example.com',
        {"Authorization":"Bearer token123","X-Custom-Header":"value"}, # optional
        1920, # optional
        1080, # optional
        2, # optional
        'dark', # optional
        'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15', # optional
        true, # optional
        'en-US', # optional
        'America/New_York', # optional
        37.7749, # optional
        -122.4194, # optional
        100, # optional
        true, # optional
        ["geolocation","notifications"], # optional
        3, # optional
        800, # optional
        600, # optional
        85, # optional
        'jpeg' # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```