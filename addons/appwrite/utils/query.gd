class_name AppwriteQuery

var method: String
var attribute: Variant
var values: Variant

func _init(p_method: String, p_attribute: Variant = null, p_values: Variant = null) -> void:
    self.method = p_method
    self.attribute = p_attribute
    self.values = p_values

func to_dict() -> Dictionary:
    var result := {
        "method": method
    }
    if attribute != null:
        result["attribute"] = attribute
    if values != null:
        if values is Array:
            result["values"] = values
        else:
            result["values"] = [values]
    return result

func _to_string() -> String:
    return JSON.stringify(to_dict())

static func equal(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("equal", attribute, value)._to_string()

static func not_equal(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("notEqual", attribute, value)._to_string()

static func regex(attribute: String, pattern: String) -> String:
    return AppwriteQuery.new("regex", attribute, pattern)._to_string()

static func less_than(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("lessThan", attribute, value)._to_string()

static func less_than_equal(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("lessThanEqual", attribute, value)._to_string()

static func greater_than(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("greaterThan", attribute, value)._to_string()

static func greater_than_equal(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("greaterThanEqual", attribute, value)._to_string()

static func search(attribute: String, value: String) -> String:
    return AppwriteQuery.new("search", attribute, value)._to_string()

static func is_null(attribute: String) -> String:
    return AppwriteQuery.new("isNull", attribute)._to_string()

static func is_not_null(attribute: String) -> String:
    return AppwriteQuery.new("isNotNull", attribute)._to_string()

static func exists(attributes: Array) -> String:
    return AppwriteQuery.new("exists", null, attributes)._to_string()

static func not_exists(attributes: Array) -> String:
    return AppwriteQuery.new("notExists", null, attributes)._to_string()

static func between(attribute: String, start: Variant, end: Variant) -> String:
    return AppwriteQuery.new("between", attribute, [start, end])._to_string()

static func starts_with(attribute: String, value: String) -> String:
    return AppwriteQuery.new("startsWith", attribute, value)._to_string()

static func ends_with(attribute: String, value: String) -> String:
    return AppwriteQuery.new("endsWith", attribute, value)._to_string()

static func contains(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("contains", attribute, value)._to_string()

static func contains_any(attribute: String, value: Array) -> String:
    return AppwriteQuery.new("containsAny", attribute, value)._to_string()

static func contains_all(attribute: String, value: Array) -> String:
    return AppwriteQuery.new("containsAll", attribute, value)._to_string()

static func not_contains(attribute: String, value: Variant) -> String:
    return AppwriteQuery.new("notContains", attribute, value)._to_string()

static func not_search(attribute: String, value: String) -> String:
    return AppwriteQuery.new("notSearch", attribute, value)._to_string()

static func not_between(attribute: String, start: Variant, end: Variant) -> String:
    return AppwriteQuery.new("notBetween", attribute, [start, end])._to_string()

static func not_starts_with(attribute: String, value: String) -> String:
    return AppwriteQuery.new("notStartsWith", attribute, value)._to_string()

static func not_ends_with(attribute: String, value: String) -> String:
    return AppwriteQuery.new("notEndsWith", attribute, value)._to_string()

static func created_before(value: String) -> String:
    return less_than("$createdAt", value)

static func created_after(value: String) -> String:
    return greater_than("$createdAt", value)

static func created_between(start: String, end: String) -> String:
    return between("$createdAt", start, end)

static func updated_before(value: String) -> String:
    return less_than("$updatedAt", value)

static func updated_after(value: String) -> String:
    return greater_than("$updatedAt", value)

static func updated_between(start: String, end: String) -> String:
    return between("$updatedAt", start, end)

static func or_query(queries: Array) -> String:
    var parsed_queries := []
    for q in queries:
        var json := JSON.new()
        var err := json.parse(q)
        if err != OK:
            continue
        parsed_queries.append(json.data)
    return AppwriteQuery.new("or", null, parsed_queries)._to_string()

static func and_query(queries: Array) -> String:
    var parsed_queries := []
    for q in queries:
        var json := JSON.new()
        var err := json.parse(q)
        if err != OK:
            continue
        parsed_queries.append(json.data)
    return AppwriteQuery.new("and", null, parsed_queries)._to_string()

static func elem_match(attribute: String, queries: Array) -> String:
    var parsed_queries := []
    for q in queries:
        var json := JSON.new()
        var err := json.parse(q)
        if err != OK:
            continue
        parsed_queries.append(json.data)
    return AppwriteQuery.new("elemMatch", attribute, parsed_queries)._to_string()

static func select(attributes: Array) -> String:
    return AppwriteQuery.new("select", null, attributes)._to_string()

static func order_asc(attribute: String) -> String:
    return AppwriteQuery.new("orderAsc", attribute)._to_string()

static func order_desc(attribute: String) -> String:
    return AppwriteQuery.new("orderDesc", attribute)._to_string()

static func order_random() -> String:
    return AppwriteQuery.new("orderRandom")._to_string()

static func cursor_before(id: String) -> String:
    return AppwriteQuery.new("cursorBefore", null, id)._to_string()

static func cursor_after(id: String) -> String:
    return AppwriteQuery.new("cursorAfter", null, id)._to_string()

static func limit(p_limit: int) -> String:
    return AppwriteQuery.new("limit", null, p_limit)._to_string()

static func offset(p_offset: int) -> String:
    return AppwriteQuery.new("offset", null, p_offset)._to_string()

static func distance_equal(attribute: String, values: Array, distance: float, meters: bool = true) -> String:
    return AppwriteQuery.new("distanceEqual", attribute, [[values, distance, meters]])._to_string()

static func distance_not_equal(attribute: String, values: Array, distance: float, meters: bool = true) -> String:
    return AppwriteQuery.new("distanceNotEqual", attribute, [[values, distance, meters]])._to_string()

static func distance_greater_than(attribute: String, values: Array, distance: float, meters: bool = true) -> String:
    return AppwriteQuery.new("distanceGreaterThan", attribute, [[values, distance, meters]])._to_string()

static func distance_less_than(attribute: String, values: Array, distance: float, meters: bool = true) -> String:
    return AppwriteQuery.new("distanceLessThan", attribute, [[values, distance, meters]])._to_string()

static func intersects(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("intersects", attribute, [values])._to_string()

static func not_intersects(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("notIntersects", attribute, [values])._to_string()

static func crosses(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("crosses", attribute, [values])._to_string()

static func not_crosses(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("notCrosses", attribute, [values])._to_string()

static func overlaps(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("overlaps", attribute, [values])._to_string()

static func not_overlaps(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("notOverlaps", attribute, [values])._to_string()

static func touches(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("touches", attribute, [values])._to_string()

static func not_touches(attribute: String, values: Array) -> String:
    return AppwriteQuery.new("notTouches", attribute, [values])._to_string()

