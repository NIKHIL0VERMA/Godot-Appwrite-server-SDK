## Enum: RELATIONSHIPTYPE

const ONETOONE = "oneToOne"
const MANYTOONE = "manyToOne"
const MANYTOMANY = "manyToMany"
const ONETOMANY = "oneToMany"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "oneToOne",
                "manyToOne",
                "manyToMany",
                "oneToMany",
            ]