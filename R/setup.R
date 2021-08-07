#' Setup Sass
#' 
#' Setup basic structure for sass.
#' 
#' @importFrom cli cli_alert_info
#' @importFrom usethis use_package
#' @importFrom fs dir_copy file_copy
#' 
#' @export 
setup_sass <- function(){
	check_scss()
	dir_copy(pkg_file("scss"), "scss")
	copy_file(pkg_file("dev", "sass.R"), c("inst", "dev", "sass.R"))
	cli_alert_info("Creating {.file scss}")
	use_package("sass", type = "Suggests")
}

#' Check that scss exists
#' 
#' If the scss directory already exists we stop.
#' 
#' @importFrom fs dir_exists
#' @noRd 
#' @keywords internal
check_scss <- function(){
	exists <- dir_exists("scss")

	if(!exists)
		return()

	stop("Directory `scss` already exists", call. = FALSE)
}
