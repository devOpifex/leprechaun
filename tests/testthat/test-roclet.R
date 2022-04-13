test_that("roclet", {
  with_temp_package()

  scaffold()
  use_sass()
  expect_message(
    roxygen2::roxygenise(roclets = "leprechaun::build_roclet")
  )
})
