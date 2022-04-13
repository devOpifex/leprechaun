test_that("scaffold default bootstrap", {
  with_temp_package()

  expect_output(scaffold())
})

test_that("scaffold fluidPage", {
  with_temp_package()

  expect_output(scaffold(ui = "fluidPage"))
})

test_that("default bootstrap", {
  with_temp_package()

  expect_output(scaffold())
})

test_that("scaffold bootstrap 4", {
  with_temp_package()

  expect_output(scaffold(bs_version = 4L))
})

test_that("scaffold bootstrap 5", {
  with_temp_package()

  expect_output(scaffold(bs_version = 5L))
})
