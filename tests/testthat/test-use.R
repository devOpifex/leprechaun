test_that("use sass", {
  with_temp_package()

  scaffold()
  expect_message(use_sass())
  expect_error(use_sass())
})

test_that("use config", {
  with_temp_package()

  scaffold()
  expect_message(use_config())
  expect_error(use_config())
})

test_that("use html", {
  with_temp_package()

  scaffold()
  expect_message(use_html_utils())
  expect_error(use_html_utils())
})

test_that("use endpoints", {
  with_temp_package()

  scaffold()
  expect_message(use_endpoints_utils())
  expect_error(use_endpoints_utils())
})
