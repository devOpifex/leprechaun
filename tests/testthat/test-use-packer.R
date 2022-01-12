source("../fns.R")

skip_on_cran()

test_that("use packer", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  expect_error(use_packer())
  packer::scaffold_leprechaun(edit = FALSE)
  expect_error(use_js_utils())
  expect_message(use_packer())
  expect_message(use_js_utils())
  expect_null(use_packer())
})
