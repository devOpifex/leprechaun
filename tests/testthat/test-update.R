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

  expect_error(update_scaffold())
  scaffold()
  expect_message(update_scaffold())
  expect_null(update_scaffold())
})
