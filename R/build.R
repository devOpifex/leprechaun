#' Build
#' 
#' Runs the various scripts that were created with 
#' `setup` functions.
#' 
#' @importFrom cli cli_alert_info cli_alert_warning
#' 
#' @export 
build <- function(){
	files <- list.files("inst/dev", pattern = ".R$")

	if(length(files) == 0){
		cli_alert_warning("Nothing to run")
		return()
	}

	sapply(files, function(file){
		cli_alert_info("Running {.file {file}}")
		source(file.path("inst", "dev", file))
	})
	invisible()
}