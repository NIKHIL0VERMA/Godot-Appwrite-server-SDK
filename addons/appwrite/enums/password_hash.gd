## Enum: PASSWORDHASH

const SHA1 = "sha1"
const SHA224 = "sha224"
const SHA256 = "sha256"
const SHA384 = "sha384"
const SHA512_224 = "sha512/224"
const SHA512_256 = "sha512/256"
const SHA512 = "sha512"
const SHA3_224 = "sha3-224"
const SHA3_256 = "sha3-256"
const SHA3_384 = "sha3-384"
const SHA3_512 = "sha3-512"

## Validate if value is in enum
static func is_valid(value: String) -> bool:
    return value in values()

## Get all values of enum
static func values() -> Array[String]:
    return [
                "sha1",
                "sha224",
                "sha256",
                "sha384",
                "sha512/224",
                "sha512/256",
                "sha512",
                "sha3-224",
                "sha3-256",
                "sha3-384",
                "sha3-512",
            ]