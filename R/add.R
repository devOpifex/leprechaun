#' Add App
#' 
#' Add the `app.R` required to run on RStudio Connect,
#' RStudio server, and shinyapps.io.
#' 
#' @importFrom cli cli_alert_success cli_alert_danger
#' @importFrom usethis use_build_ignore
#' 
#' @export 
#' \dontrun{add_app_file()}
#' 
#' @export 
add_app_file <- function(){
	file <- pkg_file("run", "prod.R")

	if(file_exists("app.R")){
		cli_alert_danger("{.file app.R} already exists")
		return(invisible())
	}

	cli_alert_success("Added {.file app.R}")
	use_build_ignore("app.R")
	copy_file(file, "app.R")
}
