test_that("add app file", {
  with_temp_package()

  scaffold()
  expect_message(add_app_file())
  expect_message(add_app_file())
})
