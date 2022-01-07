source("../fns.R")

skip_on_cran()

test_that("use sass", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  packer::scaffold_leprechaun(edit = FALSE)
  use_packer()
  use_js_utils()
  use_sass()
  use_packer()

  expect_message(build())
})
