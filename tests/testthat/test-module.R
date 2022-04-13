test_that("update", {
  with_temp_package()

  expect_error(add_module())
  scaffold()
  expect_error(add_module())
  expect_error(add_module("err or"))
  expect_message(add_module("mod"))
})
