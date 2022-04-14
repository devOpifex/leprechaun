skip_on_cran()

test_that("use packer", {
  with_temp_package()

  scaffold()
  expect_error(use_packer())
  packer::scaffold_leprechaun(edit = FALSE)
  expect_error(use_js_utils())
  expect_message(use_packer())
  expect_message(use_js_utils())
  expect_true(use_packer())
})
