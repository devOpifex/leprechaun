source("../fns.R")

skip_on_cran()

test_that("roclet", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  packer::scaffold_leprechaun(edit = FALSE)
  expect_error(use_js_utils())
  expect_message(use_packer())
  roxygen2::roxygenise(roclets = "leprechaun::build_roclet")
})
