test_that("sitrep", {
  with_temp_package()
  
  expect_message(sitrep())
  scaffold()
  expect_message(sitrep())
  expect_false(sitrep())
})
