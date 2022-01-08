source("../fns.R")

#skip_on_cran()

test_that("update", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  expect_error(update_scaffold(TRUE))
  scaffold()
  expect_message(update_scaffold(TRUE))
  expect_null(update_scaffold(TRUE))

  # manually change lock
  new_version <- "0.0.1"
  lock <- leprechaun:::lock_read()
  lock$version <- new_version
  lock$r$ui <- new_version
  lock$r$run <- new_version
  lock$r$server <- new_version
  lock$r$`leprechaun-utils` <- new_version
  lock$r$zzz <- new_version
  lock$r$inputs <- new_version
  leprechaun:::lock_write(lock)
  expect_message(update_scaffold(force = TRUE))
})
