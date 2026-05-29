extends "res://addons/gut/test.gd"

func test_permission_read():
	assert_eq(AppwritePermission.read("user:1"), 'read("user:1")')

func test_permission_write():
	assert_eq(AppwritePermission.write("role"), 'write("role")')

func test_permission_all():
	assert_eq(AppwritePermission.create("x"), 'create("x")')
	assert_eq(AppwritePermission.update("x"), 'update("x")')
	assert_eq(AppwritePermission.delete("x"), 'delete("x")')