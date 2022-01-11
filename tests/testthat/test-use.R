source("../fns.R")

test_that("use sass", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  expect_message(use_sass())
  expect_error(use_sass())
})

test_that("use config", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  expect_message(use_config())
  expect_error(use_config())
})

test_that("use html", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  expect_message(use_html_utils())
  expect_error(use_html_utils())
})

test_that("use endpoints", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  expect_message(use_endpoints_utils())
  expect_error(use_endpoints_utils())
})
