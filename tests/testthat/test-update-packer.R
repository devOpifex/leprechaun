skip_on_cran()

test_that("update", {
  with_temp_package()

  expect_error(update_scaffold(TRUE))
  scaffold()
  expect_message(update_scaffold(FALSE))
  expect_message(update_scaffold(TRUE))
  expect_true(update_scaffold(TRUE))

  packer::scaffold_leprechaun(edit = FALSE)
  use_packer()
  use_js_utils()
  
  # manually change lock
  new_version <- "0.0.1"
  lock <- leprechaun:::lock_read()
  lock$version <- new_version
  lock$uses$packer <- new_version
  lock$uses$`js-utils` <- new_version
  leprechaun:::lock_write(lock)
  expect_true(sitrep())
  expect_message(update_scaffold(FALSE))
  expect_message(update_scaffold(force = TRUE))
})
