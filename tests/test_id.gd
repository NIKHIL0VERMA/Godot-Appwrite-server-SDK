extends "res://addons/gut/test.gd"

func test_id_unique_length():
	var id = AppwriteID.unique()
	assert_true(id.length() > 10)

func test_id_unique_padding():
	var id1 = AppwriteID.unique(0)
	var id2 = AppwriteID.unique(10)
	assert_true(id2.length() > id1.length())

func test_id_unique_randomness():
	var id1 = AppwriteID.unique()
	var id2 = AppwriteID.unique()
	assert_ne(id1, id2)

func test_id_custom():
	var val = "custom_id"
	assert_eq(AppwriteID.custom(val), val)