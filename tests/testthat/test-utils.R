library(testthat)

test_that(".check_datasources works with valid input", {
  if (!isClass("MockDSConnection")) {
    setClass(
      "MockDSConnection",
      contains = "DSConnection",
      representation(dummy = "character"))
  }
  conn1 <- new("MockDSConnection", dummy = "a")
  conn2 <- new("MockDSConnection", dummy = "b")
  expect_silent(.check_datasources(list(conn1, conn2)))
})

test_that(".check_datasources throws error with non-list input", {
  expect_error(
    .check_datasources("not a list"),
    "'Datasources' must be a list of objects with class `DSConnection`")
})

test_that(".check_datasources throws error with list containing invalid elements", {
  conn <- new("MockDSConnection", dummy = "valid")
  expect_error(
    .check_datasources(list(conn, "not valid")),
    "'Datasources' must be a list of objects with class `DSConnection`")
})
