#' Check Whether Files Exist
#' 
#' Check whether core files that leprechaun creates
#' already exist in the current package. 
#' This is to make sure we do no overwrite files
#' the user may have created.
#' 
#' @importFrom fs file_exists
#' 
#' @return Boolean
#' 
#' @noRd 
#' @keywords internal
base_file_exist <- function(){
	files <- c("R/ui.R", "R/assets.R", "R/run.R")
	exist <- file_exists(files)
	any(exist)
}