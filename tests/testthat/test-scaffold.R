source("../fns.R")

skip_on_cran()

test_that("scaffold default bootstrap", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  expect_output(scaffold())
})

test_that("scaffold fluidPage", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  expect_output(scaffold(ui = "fluidPage"))
})

test_that("default bootstrap", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  expect_output(scaffold())
})

test_that("scaffold bootstrap 4", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  expect_output(scaffold(bs_version = 4L))
})

test_that("scaffold bootstrap 5", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  expect_output(scaffold(bs_version = 5L))
})
