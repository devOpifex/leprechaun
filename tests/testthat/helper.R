with_temp_package <- function(envir = parent.frame()) {
  wd <- getwd()
  withr::defer(setwd(wd), envir = envir)
  pkg <- create_tmp_package(envir = envir)
  setwd(pkg)
  return(pkg)
}

create_tmp_package <- function(envir = parent.frame()) {
  tmp <- tempdir()
  pdir <- file.path(tmp, "package")
  dir.create(pdir)
  # ensure empty
  purrr::walk(list.files(pdir), empty, dir = pdir)
  op <- options(usethis.quiet = TRUE)
  suppressMessages(ppath <- usethis::create_package(pdir, open = FALSE))
  options(op)
  withr::defer(delete_tmp_package(pdir), envir = envir)
  return(ppath)
}

empty <- function(file, dir) {
  unlink(
    file.path(dir, file),
    recursive = TRUE, force = TRUE
  )
}

delete_tmp_package <- function(dir) {
  unlink(dir, recursive = TRUE, force = TRUE)
}
