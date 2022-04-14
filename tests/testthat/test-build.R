skip_on_cran()

test_that("use sass", {
  with_temp_package()
  scaffold()
  expect_message(build())
  packer::scaffold_leprechaun(edit = FALSE)
  use_packer()
  use_js_utils()
  use_sass()
  use_packer()

  expect_message(build())
})
