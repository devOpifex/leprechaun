create_tmp_package <- function(){
  tmp <- tempdir()
  # make sure it's empty
  files <- list.files(tmp)
  sapply(files, empty, dir = tmp)
  suppressMessages(usethis::create_package(tmp))
  return(tmp)
}

empty <- function(file, dir = tmp){
  path <- file.path(dir, file)
  unlink(file, recursive = TRUE, force = TRUE)
}

delete_tmp_package <- function(tmp){
  unlink(tmp, recursive = TRUE, force = TRUE)
}
