List all invoices tied to an account.
```gdscript
extends Node

func _ready():
    # You can skip setup if you have .env
    Appwrite.set_endpoint('https://<REGION>.cloud.appwrite.io/v1') # Your API Endpoint
    Appwrite.set_project('<YOUR_PROJECT_ID>') # Your project ID

    var result = await Appwrite.account.list_invoices(
        [] # optional
    )

    if result is AppwriteException:
        push_error(result.message)
    
    if result is AppwriteInvoiceList:
        print(result.to_dict())
```