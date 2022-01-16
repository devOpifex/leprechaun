#' Build
#' 
#' Runs the various scripts that were created with 
#' `setup` functions.
#' 
#' @importFrom cli cli_alert_success cli_alert_warning
#' 
#' @examples 
#' \dontrun{build()}
#' 
#' @importFrom roxygen2 roclet
#' 
#' @name build
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

#' Build Roclet
#' 
#' Roclet to run [build()] when documenting.
#' Meant to be used in `DESCRIPTION`, e.g.:
#' `Roxygen: list(markdown = TRUE, roclets = c("namespace", "collate", "rd", "leprechaun::build_roclet"))`
#' 
#' @import roxygen2
#' 
#' @export 
build_roclet <- function() {
	roclet("build")
}

#' @export 
roclet_process.roclet_build <- function(
	x, 
	blocks, 
	env, 
	base_path
) {
	invisible()
}

#' @export 
roclet_output.roclet_build <- function(
	x, 
	results, 
	base_path, 
	...
) {
	build()
}
