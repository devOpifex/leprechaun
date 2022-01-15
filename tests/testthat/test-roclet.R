source("../fns.R")

test_that("roclet", {
  wd <- getwd()
  pkg <- create_tmp_package()
  setwd(pkg)
  on.exit({
    setwd(wd)
    delete_tmp_package(pkg)
  })

  scaffold()
  use_sass()
  expect_message(
    roxygen2::roxygenise(roclets = "leprechaun::build_roclet")
  )
})
