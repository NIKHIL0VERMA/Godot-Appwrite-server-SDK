## getCreditCard
The credit card endpoint will return you the icon of the credit card provider you need. Use width, height and quality arguments to change the output settings.

When one dimension is specified and the other is 0, the image is scaled with preserved aspect ratio. If both dimensions are 0, the API provides an image at source quality. If dimensions are not specified, the default size of image returned is 100x100px.


---

### Usage Example

```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID
    Appwrite.set_session('') # The user session to authenticate with

    var result = await Appwrite.avatars.get_credit_card(
        Appwrite.CreditCard.AMERICAN_EXPRESS,
        0, # optional
        0, # optional
        -1 # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is Variant:
        print(result.to_dict())
```
---