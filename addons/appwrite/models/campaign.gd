class_name AppwriteCampaign
extends RefCounted
## Campaign[br]


const _FIELD_MAP := {
    "id": "$id",
    "template": "template",
    "title": "title",
    "description": "description",
    "plan": "plan",
    "cta": "cta",
    "claimed": "claimed",
    "unclaimed": "unclaimed",
    "image": "image",
    "reviews": "reviews",
    "onlyneworgs": "onlyNewOrgs",
    "footer": "footer",
}

var id: String ## Campaign ID
var template: String ## Campaign template
var title: String ## Campaign title
var description: String ## Campaign description
var plan: String ## Billing plan campaign is associated with
var cta: String ## Campaign CTA
var claimed: String ## Campaign info when claimed
var unclaimed: String ## Campaign infor when unclaimed
var image: Dictionary ## Campaign images
var reviews: Array ## Campaign reviews
var onlyneworgs: bool ## Campaign valid only for new orgs.
var footer: bool ## Is footer

## Convert dictionary to model
static func from_dict(dict: Dictionary):
    var m := AppwriteCampaign.new()

    for key in _FIELD_MAP:
        var raw_key = _FIELD_MAP[key]
        
        # Skip if key doesn't exist in dict
        if not dict.has(raw_key):
            continue
        
        var value = dict.get(raw_key)

        if key == "reviews" and value is Array:
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