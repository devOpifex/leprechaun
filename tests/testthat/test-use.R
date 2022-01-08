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
