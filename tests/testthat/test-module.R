source("../fns.R")

skip_on_cran()

test_that("update", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  expect_error(add_module())
  scaffold()
  expect_error(add_module())
  expect_error(add_module("err or"))
  expect_message(add_module("mod"))
})
