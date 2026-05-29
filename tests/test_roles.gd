extends "res://addons/gut/test.gd"

func test_role_any():
	assert_eq(AppwriteRole.any(), "any")

func test_role_user():
	assert_eq(AppwriteRole.user("123"), "user:123")

func test_role_user_with_status():
	assert_eq(AppwriteRole.user("123", "verified"), "user:123/verified")

func test_role_team():
	assert_eq(AppwriteRole.team("team1"), "team:team1")

func test_role_team_with_role():
	assert_eq(AppwriteRole.team("team1", "admin"), "team:team1/admin")

func test_role_label():
	assert_eq(AppwriteRole.label("vip"), "label:vip")