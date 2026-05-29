## Enum: CREDITCARD

const AMERICAN_EXPRESS = "amex"
const ARGENCARD = "argencard"
const CABAL = "cabal"
const CENCOSUD = "cencosud"
const DINERS_CLUB = "diners"
const DISCOVER = "discover"
const ELO = "elo"
const HIPERCARD = "hipercard"
const JCB = "jcb"
const MASTERCARD = "mastercard"
const NARANJA = "naranja"
const TARJETA_SHOPPING = "targeta-shopping"
const UNION_PAY = "unionpay"
const VISA = "visa"
const MIR = "mir"
const MAESTRO = "maestro"
const RUPAY = "rupay"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "amex",
                "argencard",
                "cabal",
                "cencosud",
                "diners",
                "discover",
                "elo",
                "hipercard",
                "jcb",
                "mastercard",
                "naranja",
                "targeta-shopping",
                "unionpay",
                "visa",
                "mir",
                "maestro",
                "rupay",
            ]