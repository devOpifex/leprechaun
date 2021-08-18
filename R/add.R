#' Add App
#' 
#' Add the `app.R` required to run on RStudio Connect,
#' RStudio server, and shinyapps.io.
#' 
#' @export 
add_app_file <- function(){
	file <- pkg_file("run", "prod.R")

	if(file_exists("app.R")){
		cli_alert_danger("{.file app.R} already exists")
		return(invisible())
	}

	cli_alert_success("Added {.file app.R}")
	copy_file(file, "app.R")
}
