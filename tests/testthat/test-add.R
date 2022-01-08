source("../fns.R")

skip_on_cran()

test_that("add app file", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  expect_message(add_app_file())
})
