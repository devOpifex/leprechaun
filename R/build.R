#' Build
#' 
#' Runs the various scripts that were created with 
#' `setup` functions.
#' 
#' @importFrom cli cli_alert_success cli_alert_warning
#' 
#' @export 
build <- function(){
	files <- list.files("inst/dev", pattern = ".R$")

	if(length(files) == 0){
		cli_alert_warning("Nothing to build")
		return()
	}

	sapply(files, function(file){
		cli_alert_success("Running {.file {file}}")
		source(file.path("inst", "dev", file))
	})
	invisible()
}